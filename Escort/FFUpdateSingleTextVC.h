//
//  FFUpdateSingleTextVC.h
//  FFEscort
//
//  Created by fanly frank on 9/21/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FFUpdateSingleTextVCDelegate <NSObject>

@required
- (void)updateSingleTextVCDidUpdateTextTo:(NSString *)updateText for:(NSIndexPath *)indexPath;
- (void)updateSingleTextVCDidCancle;

@end

@interface FFUpdateSingleTextVC : UIViewController

@property (copy, nonatomic) NSString *originalText;

@property (weak, nonatomic) id<FFUpdateSingleTextVCDelegate> delegate;

@property (strong, nonatomic) NSIndexPath *indexPath;

@end
