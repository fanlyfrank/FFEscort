//
//  FFUserFunctionCell.h
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFUserFunctionCell : UITableViewCell

@property (strong, nonatomic) UIImageView *functionIconView;
@property (strong, nonatomic) UILabel *functionNameLabel;
@property (strong, nonatomic) UIImageView *arrowImgView;

@property (assign, nonatomic) Boolean isShowSeparator;
@property (strong, nonatomic) UIColor *separatorColor;

- (CGFloat)getHeight;
@end
