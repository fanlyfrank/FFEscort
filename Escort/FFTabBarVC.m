//
//  FFTabBarVC.m
//  FFEscort
//
//  Created by fanly frank on 9/9/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UMengSocialCOM/UMSocialAccountManager.h>
#import <UMengSocialCOM/UMSocialSnsPlatformManager.h>

#import "FFTabBarVC.h"
#import "FFGlobalMacro.h"

#import "FFLoginVC.h"
#import "FFUserClient.h"

@interface FFTabBarVC () <UITabBarControllerDelegate>

@end

@implementation FFTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSUInteger indexOfTab = [tabBarController.viewControllers indexOfObject:viewController];

    if (indexOfTab != 0 && (
        ![FFUserClient isLocalLoginSuccess] ||
        ![UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToWechatSession])) {
        
        FFLoginVC *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                              instantiateViewControllerWithIdentifier:NSStringFromClass([FFLoginVC class])];
        
        loginVC.view.backgroundColor = FFRandomColor;
        loginVC.successTargetVC = viewController;
        loginVC.tabBarVC = self;
        
        [self presentViewController:loginVC animated:YES completion:nil];
        return NO;
    }

    return YES;
}

@end
