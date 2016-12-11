//
//  FFLoginVC.m
//  FFEscort
//
//  Created by fanly frank on 9/9/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UMengSocialCOM/UMSocialData.h>
#import <UMengSocialCOM/UMSocialSnsService.h>
#import <UMengSocialCOM/UMSocialSnsPlatformManager.h>
#import <UMengSocialCOM/UMSocialAccountManager.h>

#import "FFLoginVC.h"
#import "FFUserClient.h"

#import "MBProgressHUD+Addition.h"

@interface FFLoginVC () <UMSocialUIDelegate>

@property (strong, nonatomic) FFUserClient *userClient;

@end

@implementation FFLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (FFUserClient *) userClient {
    if (!_userClient) {
        _userClient = [[FFUserClient alloc] init];
    }
    
    return _userClient;
}

- (IBAction)cancleClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)weChatLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform =
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self, [UMSocialControllerService defaultControllerService], YES, ^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount =
            [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            
            
            [UMSocialAccountManager postSnsAccount:snsAccount completion:^(UMSocialResponseEntity *response) {
                
                [self.userClient registerOrLoginWithSnsUser:snsAccount success:^{
                    
                    self.tabBarVC.selectedViewController = self.successTargetVC;
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                } failure:^{
                    
                    [MBProgressHUD showToastWithTitle:@"登录发生错误，请重试！" success:NO superContainer:self.view];
                }];
                
            }];
        }
    });
    
}

- (IBAction)weiboLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            //NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
@end
