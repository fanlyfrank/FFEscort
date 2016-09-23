//
//  FFOrderCell.m
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFOrderCell.h"
#import "FFGlobalMacro.h"

@interface FFOrderCell ()

@property (strong, nonatomic) UILabel *stateLabel;

@property (strong, nonatomic) UIView *infoBackView;

@property (strong, nonatomic) UIView *thinSeparator;
@property (strong, nonatomic) UIButton *functionBtn;
@property (strong, nonatomic) UIView *fatSeparator;

@end

@implementation FFOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (_showState) {
            
        case FFOrderCellShowStateWaitPay:
            _stateLabel.text = @"待付款";
            [_functionBtn setTitle:@"付款" forState:UIControlStateNormal];
            [_functionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _functionBtn.backgroundColor = FFHighlightColor;
            _functionBtn.layer.borderColor = FFHighlightColor.CGColor;
            _functionBtn.layer.borderWidth = .5;
            break;
            
        case FFOrderCellShowStatePayed:
            _stateLabel.text = @"已付款";
            [_functionBtn setTitle:@"申请退款" forState:UIControlStateNormal];
            [_functionBtn setTitleColor:FFDarkColor forState:UIControlStateNormal];
            _functionBtn.backgroundColor = [UIColor whiteColor];
            _functionBtn.layer.borderColor = FFDarkColor.CGColor;
            _functionBtn.layer.borderWidth = .5;
            break;
            
        case FFOrderCellShowStateWaitJuage:
            _stateLabel.text = @"待评价";
            [_functionBtn setTitle:@"评价" forState:UIControlStateNormal];
            [_functionBtn setTitleColor:FFHighlightColor forState:UIControlStateNormal];
            _functionBtn.backgroundColor = [UIColor whiteColor];
            _functionBtn.layer.borderColor = FFHighlightColor.CGColor;
            _functionBtn.layer.borderWidth = .5;
            break;
            
        case FFOrderCellShowStateJuaged:
            _stateLabel.text = @"已评价";
            [_functionBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [_functionBtn setTitleColor:FFDarkColor forState:UIControlStateNormal];
            _functionBtn.backgroundColor = [UIColor whiteColor];
            _functionBtn.layer.borderColor = FFDarkColor.CGColor;
            _functionBtn.layer.borderWidth = .5;
            break;
            
        case FFOrderCellShowStateClosed:
            _stateLabel.text = @"已关闭";
            [_functionBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [_functionBtn setTitleColor:FFDarkColor forState:UIControlStateNormal];
            _functionBtn.backgroundColor = [UIColor whiteColor];
            _functionBtn.layer.borderColor = FFDarkColor.CGColor;
            _functionBtn.layer.borderWidth = .5;
            break;
            
        default:
            break;
    }

    CGSize createTimeSize = [_createTimeLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                                options:NSStringDrawingUsesFontLeading
                                                             attributes:@{NSFontAttributeName:_createTimeLabel.font}
                                                                context:nil].size;
    CGRect createTimeFrame = CGRectMake(10, 10, createTimeSize.width, createTimeSize.height);
    
    CGSize stateSize = [_stateLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                      options:NSStringDrawingUsesFontLeading
                                                   attributes:@{NSFontAttributeName:_stateLabel.font}
                                                      context:nil].size;
    CGRect stateFrame = CGRectMake(FFScreenW - stateSize.width - 10, 10, stateSize.width, stateSize.height);
    
    CGRect productImgFrame = CGRectMake(10, createTimeFrame.origin.y + createTimeFrame.size.height + 10, 99, 80);
    
    CGSize productInfoSize = [TTTAttributedLabel sizeThatFitsAttributedString:_productInfoLabel.attributedText
                                                              withConstraints:CGSizeMake(FFScreenW - 99 - 30, 80 - 30)
                                                       limitedToNumberOfLines:MAXFLOAT];
    CGRect productInfoFrame = CGRectMake(productImgFrame.origin.x + productImgFrame.size.width + 10, productImgFrame.origin.y + 15, productInfoSize.width, productInfoSize.height);
    
    CGRect backFrame = CGRectMake(0, productImgFrame.origin.y, FFScreenW, 80);
    
    CGSize startSize = [_startTimeLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                          options:NSStringDrawingUsesFontLeading
                                                       attributes:@{NSFontAttributeName:_startTimeLabel.font}
                                                          context:nil].size;
    CGRect startFrame = CGRectMake(10, productImgFrame.origin.y + productImgFrame.size.height + 9, startSize.width, startSize.height);
    
    CGSize amountSize = [_amountLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                        options:NSStringDrawingUsesFontLeading
                                                     attributes:@{NSFontAttributeName:_amountLabel.font}
                                                        context:nil].size;
    CGRect amountFrame = CGRectMake(10, startFrame.origin.y + startFrame.size.height + 2, amountSize.width, amountSize.height);
    
    CGSize countSize = [_countLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                      options:NSStringDrawingUsesFontLeading
                                                   attributes:@{NSFontAttributeName:_countLabel.font}
                                                      context:nil].size;
    CGRect countFrame = CGRectMake(10, amountFrame.origin.y + amountFrame.size.height + 2, countSize.width, countSize.height);
    
    CGRect thinSeparatorFrame = CGRectMake(0, countFrame.origin.y + countFrame.size.height + 10, FFScreenW, 1);
    
    CGRect functionFrame = CGRectMake(FFScreenW - 10 - 60, thinSeparatorFrame.origin.y + thinSeparatorFrame.size.height + 10, 60, 25);
    
    CGRect fatSeparatorFrame = CGRectMake(0, functionFrame.origin.y + functionFrame.size.height + 10, FFScreenW, 5);
    
    _createTimeLabel.frame = createTimeFrame;
    _stateLabel.frame = stateFrame;
    _infoBackView.frame = backFrame;
    _productImgView.frame = productImgFrame;
    _productInfoLabel.frame = productInfoFrame;
    _startTimeLabel.frame = startFrame;
    _amountLabel.frame = amountFrame;
    _countLabel.frame = countFrame;
    _thinSeparator.frame = thinSeparatorFrame;
    _functionBtn.frame = functionFrame;
    _fatSeparator.frame = fatSeparatorFrame;
    
}

- (CGFloat)getHeight {
    CGFloat result;
    
    CGSize createTimeSize = [_createTimeLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                                options:NSStringDrawingUsesFontLeading
                                                             attributes:@{NSFontAttributeName:_createTimeLabel.font}
                                                                context:nil].size;
    CGSize startSize = [_startTimeLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                          options:NSStringDrawingUsesFontLeading
                                                       attributes:@{NSFontAttributeName:_startTimeLabel.font}
                                                          context:nil].size;
    CGSize amountSize = [_amountLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                        options:NSStringDrawingUsesFontLeading
                                                     attributes:@{NSFontAttributeName:_amountLabel.font}
                                                        context:nil].size;
    CGSize countSize = [_countLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                      options:NSStringDrawingUsesFontLeading
                                                   attributes:@{NSFontAttributeName:_countLabel.font}
                                                      context:nil].size;
    
    result = createTimeSize.height + startSize.height + amountSize.height + countSize.height + 80 + 6 * 10 + 2 * 2 + 30;
    
    return result;
}

- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _createTimeLabel = [[UILabel alloc] init];
    _createTimeLabel.font = FFSmallFont;
    _createTimeLabel.textColor = FFDarkColor;
    
    _stateLabel = [[UILabel alloc] init];
    _stateLabel.font = FFNormalFont;
    _stateLabel.textColor = FFHighlightColor;
    
    _infoBackView = [[UIView alloc] init];
    _infoBackView.backgroundColor = FFBackColor;
    
    _productImgView = [[UIImageView alloc] init];
    _productImgView.contentMode = UIViewContentModeScaleAspectFill;
    _productImgView.clipsToBounds = YES;
    
    _productInfoLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    _productInfoLabel.font = FFNormalFont;
    _productInfoLabel.textColor = FFNormalColor;
    _productInfoLabel.numberOfLines = 3;
    
    _startTimeLabel = [[UILabel alloc] init];
    _startTimeLabel.font = FFSmallFont;
    _startTimeLabel.textColor = FFDarkColor;
    
    _amountLabel = [[UILabel alloc] init];
    _amountLabel.font = FFSmallFont;
    _amountLabel.textColor = FFDarkColor;
    
    _countLabel = [[UILabel alloc] init];
    _countLabel.font = FFSmallFont;
    _countLabel.textColor = FFDarkColor;
    
    _thinSeparator = [[UIView alloc] init];
    _thinSeparator.backgroundColor = FFBackColor;
    
    _functionBtn = [[UIButton alloc] init];
    _functionBtn.layer.cornerRadius = 4;
    _functionBtn.titleLabel.font = FFNormalFont;
    
    _fatSeparator = [[UIView alloc] init];
    _fatSeparator.backgroundColor = FFBackColor;
    
    [self.contentView addSubview:_createTimeLabel];
    [self.contentView addSubview:_stateLabel];
    [self.contentView addSubview:_infoBackView];
    [self.contentView addSubview:_productImgView];
    [self.contentView addSubview:_productInfoLabel];
    [self.contentView addSubview:_startTimeLabel];
    [self.contentView addSubview:_amountLabel];
    [self.contentView addSubview:_countLabel];
    [self.contentView addSubview:_thinSeparator];
    [self.contentView addSubview:_functionBtn];
    [self.contentView addSubview:_fatSeparator];
}

@end
