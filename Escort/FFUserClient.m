//
//  FFUserClient.m
//  FFEscort
//
//  Created by fanly frank on 10/18/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UMengSocialCOM/UMSocialData.h>
#import <UMengSocialCOM/UMSocialSnsService.h>
#import <UMengSocialCOM/UMSocialSnsPlatformManager.h>
#import <UMengSocialCOM/UMSocialAccountManager.h>

#import "HttpClient.h"
#import "FFUserClient.h"

@implementation FFUserClient

- (void)registerOrLoginWithSnsUser:(UMSocialAccountEntity *)snsUser
                           success:(void(^)())success
                           failure:(void(^)())failure {
    
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *unionid = [[NSUserDefaults standardUserDefaults] objectForKey:snsUser.usid];
    
    if (unionid) {
        //该用户已经存在，更新accessToken即可，更新accessToken需要提供旧的accessToken
            
            [param setValue:unionid forKey:@"oldAccessToken"];
            [param setValue:snsUser forKey:@"user"];
            
            [[HttpClient sharedClient] postApi:@"user/updateTokenAndLogin"
                                        params:param
                                      progress:nil
                                       success:^(NSURLSessionDataTask *task, id responseObject) {
                                           
                                           [UMSocialAccountManager setSnsAccount:snsUser];
                                           [[NSUserDefaults standardUserDefaults] setObject:snsUser.unionId forKey:snsUser.usid];
                                           success();
                                       }
             
                                       failure:^(NSURLSessionDataTask *task, NSError *error) {
                                           failure();
                                       }];
        
    }
    
    else {

        [param setValue:snsUser.usid forKey:@"user.id"];
        [param setValue:snsUser.unionId forKey:@"user.unionId"];
        [param setValue:snsUser.userName forKey:@"user.nickname"];
        [param setValue:snsUser.accessToken forKey:@"user.token"];
        [param setValue:snsUser.iconURL forKey:@"user.avatarUrl"];
        [param setValue:snsUser.platformName forKey:@"user.source"];
        
        [param setValue:@"fanly" forKey:@"testField"];
        
        [[HttpClient sharedClient] postApi:@"user/registerAndLogin"
                                    params:param
                                  progress:nil
         
                                   success:^(NSURLSessionDataTask *task, id responseObject) {
                                       //缓存当前用户信息
                                       [UMSocialAccountManager setSnsAccount:snsUser];
                                       [[NSUserDefaults standardUserDefaults] setObject:snsUser.usid forKey:snsUser.usid];
                                       [FFUserClient setLocalLogin:YES];
                                       success();
                                   }
         
                                   failure:^(NSURLSessionDataTask *task, NSError *error) {
                                       failure();
                                       [FFUserClient setLocalLogin:NO];
                                   }];
    }
}

+ (void)setLocalLogin:(BOOL)isSuccess {
    [[NSUserDefaults standardUserDefaults] setBool:isSuccess forKey:@"FF_LOCAL_LOGIN_STATUS"];
}

+ (BOOL)isLocalLoginSuccess {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"FF_LOCAL_LOGIN_STATUS"];
}
@end
