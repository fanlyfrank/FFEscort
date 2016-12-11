//
//  FFUserClient.h
//  FFEscort
//
//  Created by fanly frank on 10/18/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFUserClient : NSObject

- (void)registerOrLoginWithSnsUser:(UMSocialAccountEntity *)snsUser
                           success:(void(^)())success
                           failure:(void(^)())failure;

+ (void)setLocalLogin:(BOOL)isSuccess;
+ (BOOL)isLocalLoginSuccess;
@end
