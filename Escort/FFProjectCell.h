//
//  FFProjectCell.h
//  FFEscort
//
//  Created by fanly frank on 9/8/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@protocol FFProjectCellDelegate <NSObject>

@required
- (void)projectCellDidFunctionAt:(NSIndexPath *)index;

@end

@interface FFProjectCell : UITableViewCell

#pragma mark -- views
@property (strong, nonatomic) UIImageView *mainImgView;
@property (strong, nonatomic) UIImageView *decorationImgView;

@property (strong, nonatomic) UIButton *functionBtn;
@property (strong, nonatomic) UIView *titleBackView;
@property (strong, nonatomic) UILabel *titleLable;

@property (strong, nonatomic) TTTAttributedLabel *subTitleLable;

@property (strong, nonatomic) UIView *separatorView;

#pragma mark -- function params
@property (weak, nonatomic) id<FFProjectCellDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

#pragma mark -- public methods
- (CGFloat)getHeight;

@end
