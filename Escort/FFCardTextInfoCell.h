//
//  FFCardTextInfoCell.h
//  FFEscort
//
//  Created by fanly frank on 9/20/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFCardTextInfoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *cardIconView;
@property (strong, nonatomic) UILabel *cardNameLabel;
@property (strong, nonatomic) UILabel *cardInfoLabel;
@property (strong, nonatomic) UIImageView *arrowImgView;

@property (assign, nonatomic) BOOL needHideSeparator;

@property (strong, nonatomic) UIColor *separatorColor;
@end
