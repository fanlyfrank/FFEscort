//
//  FFLoginVC.h
//  FFEscort
//
//  Created by fanly frank on 9/9/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTabBarVC.h"

@interface FFLoginVC : UIViewController

@property (strong, nonatomic) FFTabBarVC *tabBarVC;

@property (strong, nonatomic) UIViewController *successTargetVC;

@end
