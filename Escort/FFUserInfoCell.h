//
//  FFUserInfoCell.h
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFUserInfoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *avatarImgView;
@property (strong, nonatomic) UILabel *nicknameLabel;
@property (strong, nonatomic) UILabel *escortNoLabel;

@property (strong, nonatomic) UIImageView *arrowImgView;

@property (strong, nonatomic) UIView *separatorView;

- (CGFloat)getHeigth;
@end
