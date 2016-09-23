//
//  FFProjectCell.m
//  FFEscort
//
//  Created by fanly frank on 9/8/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFProjectCell.h"
#import "FFGlobalMacro.h"

@interface FFProjectCell ()

@property (assign, nonatomic) CGFloat bigImgWidthFactor;
@property (assign, nonatomic) CGFloat decorationImgWithFactor;
@property (assign, nonatomic) CGFloat functionBtnWidthFactor;
@property (assign, nonatomic) CGFloat contentLeftPadding;
@property (assign, nonatomic) CGFloat contentUpPadding;
@property (assign, nonatomic) CGFloat contentBackPadding;

@end


@implementation FFProjectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect mainImgFrame = CGRectMake(0, 0, FFScreenW, _bigImgWidthFactor * FFScreenW);
    CGRect decorationImgFrame = CGRectMake(0, 0, _decorationImgWithFactor * FFScreenW,
                                           _decorationImgWithFactor * FFScreenW);
    CGRect functionBtnFrame = CGRectMake(FFScreenW - _functionBtnWidthFactor * FFScreenW, 0,
                                         _functionBtnWidthFactor * FFScreenW,
                                         _functionBtnWidthFactor * FFScreenW);
    
    CGRect titleBackFrame = CGRectZero;
    CGRect titleFrame = CGRectZero;
    CGSize titleSize = [_titleLable.text boundingRectWithSize:CGSizeMake(FFScreenW - 2 * _contentUpPadding, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:_titleLable.font}
                                                      context:nil].size;
    
    titleBackFrame = CGRectMake(0, mainImgFrame.size.height - titleSize.height - 2 * _contentBackPadding,
                                FFScreenW, titleSize.height + 2 * _contentBackPadding);
    titleFrame = CGRectMake(_contentLeftPadding, mainImgFrame.size.height - titleSize.height - _contentBackPadding,
                            FFScreenW, titleSize.height);
    
    CGSize subTitleSize =
    [TTTAttributedLabel sizeThatFitsAttributedString:_subTitleLable.attributedText
                                     withConstraints:CGSizeMake(FFScreenW - 2 * _contentLeftPadding, MAXFLOAT)
                              limitedToNumberOfLines:MAXFLOAT];
    
    CGRect subTitleFrame =
    CGRectMake(_contentLeftPadding, titleBackFrame.origin.y + titleBackFrame.size.height + _contentUpPadding,
               subTitleSize.width, subTitleSize.height);
    CGRect separatorFrame = CGRectMake(0, subTitleFrame.origin.y + subTitleFrame.size.height + _contentUpPadding,
                                       FFScreenW, 8);
    
    _mainImgView.frame = mainImgFrame;
    _decorationImgView.frame = decorationImgFrame;
    _functionBtn.frame = functionBtnFrame;
    _titleBackView.frame = titleBackFrame;
    _titleLable.frame = titleFrame;
    _subTitleLable.frame = subTitleFrame;
    _separatorView.frame = separatorFrame;
}

- (CGFloat)getHeight {
    
    CGSize subTitleSize =
    [TTTAttributedLabel sizeThatFitsAttributedString:_subTitleLable.attributedText
                                     withConstraints:CGSizeMake(FFScreenW - 2 * _contentLeftPadding, MAXFLOAT)
                              limitedToNumberOfLines:MAXFLOAT];
    
    return _bigImgWidthFactor * FFScreenW + subTitleSize.height + 2 * _contentUpPadding + 8;
}

#pragma mark -- private methods
- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _bigImgWidthFactor = .55;
    _decorationImgWithFactor = .15;
    _functionBtnWidthFactor = .15;
    _contentLeftPadding = 10;
    _contentUpPadding = 9;
    _contentBackPadding = 4;
    
    _mainImgView = [[UIImageView alloc] init];
    _mainImgView.backgroundColor = FFBackColor;
    _mainImgView.clipsToBounds = YES;
    _mainImgView.contentMode = UIViewContentModeScaleAspectFill;
    
    _decorationImgView = [[UIImageView alloc] init];
    _decorationImgView.contentMode = UIViewContentModeScaleAspectFill;
    
    _functionBtn = [[UIButton alloc] init];
    [_functionBtn addTarget:self
                     action:@selector(functionBtnClick:)
           forControlEvents:UIControlEventTouchUpInside];
    
    _titleBackView = [[UIView alloc] init];
    _titleBackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    
    _titleLable = [[UILabel alloc] init];
    _titleLable.font = FFSmallFont;
    _titleLable.textColor = [UIColor whiteColor];
    _titleLable.numberOfLines = 1;
    
    _subTitleLable = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    _subTitleLable.font = FFSmallFont;
    _subTitleLable.textColor = FFNormalColor;
    _subTitleLable.numberOfLines = MAXFLOAT;
    
    _separatorView = [[UIView alloc] init];
    _separatorView.backgroundColor = FFBackColor;
    
    [self.contentView addSubview:_mainImgView];
    [self.contentView addSubview:_decorationImgView];
    [self.contentView addSubview:_functionBtn];
    [self.contentView addSubview:_titleBackView];
    [self.contentView addSubview:_titleLable];
    [self.contentView addSubview:_subTitleLable];
    [self.contentView addSubview:_separatorView];
}

- (void)functionBtnClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(projectCellDidFunctionAt:)]) {
        [self.delegate projectCellDidFunctionAt:self.indexPath];
    }
}
@end
