//
//  FFCardImgInfoCell.h
//  FFEscort
//
//  Created by fanly frank on 9/19/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFCardImgInfoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *cardIconView;
@property (strong, nonatomic) UILabel *cardNameLabel;
@property (strong, nonatomic) UIImageView *cardInfoImgView;
@property (strong, nonatomic) UIImageView *arrowImgView;

@property (strong, nonatomic) UIColor *separatorColor;
@end
