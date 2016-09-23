//
//  FFOrderCell.h
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>

typedef NS_ENUM(NSInteger, FFOrderCellShowState) {
    FFOrderCellShowStateWaitPay,
    FFOrderCellShowStatePayed,
    FFOrderCellShowStateWaitJuage,
    FFOrderCellShowStateJuaged,
    FFOrderCellShowStateClosed,
};

@interface FFOrderCell : UITableViewCell

@property (strong, nonatomic) UILabel *createTimeLabel;
@property (strong, nonatomic) UIImageView *productImgView;
@property (strong, nonatomic) TTTAttributedLabel *productInfoLabel;
@property (strong, nonatomic) UILabel *startTimeLabel;
@property (strong, nonatomic) UILabel *amountLabel;
@property (strong, nonatomic) UILabel *countLabel;

@property (assign, nonatomic) FFOrderCellShowState showState;

- (CGFloat)getHeight;
@end
