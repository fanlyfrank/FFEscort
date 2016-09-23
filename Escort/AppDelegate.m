//
//  AppDelegate.m
//  Escort
//
//  Created by fanly frank on 9/5/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "AppDelegate.h"
#import "FFGlobalMacro.h"

#import <UMSocial.h>
#import <UMengSocialCOM/UMSocialWechatHandler.h>
#import <UMengSocialCOM/UMSocialQQHandler.h>
#import <UMengSocialCOM/UMSocialSinaSSOHandler.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self umengParamsSetting];
    
    [self appearanceSetting];
    
    return YES;
}

- (void)umengParamsSetting {
    
    [UMSocialData setAppKey:@"57e39b6467e58ead0d0024e8"];
    
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f"
                            appSecret:@"db426a9829e4b49a0dcac7b4162da6b6"
                                  url:@"http://www.umeng.com/social"];
    
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

- (void)appearanceSetting {
    
    self.window.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:FFBigFont}];
    [[UITabBarItem appearance]
     setTitleTextAttributes:@{NSForegroundColorAttributeName:FFNormalColor,NSFontAttributeName:FFBigFont}
     forState:UIControlStateSelected];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, -1.5, 0);
    UIImage *alignedImage = [[UIImage imageNamed:@"left"] imageWithAlignmentRectInsets:insets];
    [[UINavigationBar appearance] setBackIndicatorImage:alignedImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:alignedImage];
    [[UIBarButtonItem appearance]
     setTitleTextAttributes:@{NSFontAttributeName:FFNormalFont}
     forState:UIControlStateNormal];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

@end
