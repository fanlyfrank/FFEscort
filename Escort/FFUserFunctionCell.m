//
//  FFUserFunctionCell.m
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFUserFunctionCell.h"
#import "FFGlobalMacro.h"

@interface FFUserFunctionCell ()

@property (strong, nonatomic) UIView *separatorView;

@end

@implementation FFUserFunctionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect functionIconFrame = CGRectMake(20, 14, 16, 14.5);
    CGSize functionNameSize = [_functionNameLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                                    options:NSStringDrawingUsesFontLeading
                                                                 attributes:@{NSFontAttributeName:_functionNameLabel.font}
                                                                    context:nil].size;
    CGRect functionNameFrame = CGRectMake(functionIconFrame.origin.x + functionIconFrame.size.width + 10, 0, functionNameSize.width, functionNameSize.height);
    
    CGRect arrowImgFrame = CGRectMake(FFScreenW - 17.5, 0, 7.5, 13.5);
    
    CGRect separatorFrame = CGRectZero;
    if (_isShowSeparator) {
        separatorFrame = CGRectMake(16, functionIconFrame.origin.y + functionIconFrame.size.height + 14, FFScreenW - 21, .5);
    }
    
    _functionIconView.frame = functionIconFrame;
    _functionNameLabel.frame = functionNameFrame;
    _functionNameLabel.center = CGPointMake(_functionNameLabel.center.x, _functionIconView.center.y);
    _arrowImgView.frame = arrowImgFrame;
    _arrowImgView.center = CGPointMake(_arrowImgView.center.x, _functionIconView.center.y);
    _separatorView.frame = separatorFrame;
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorView.backgroundColor = separatorColor;
}

- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _functionIconView = [[UIImageView alloc] init];
    _functionNameLabel = [[UILabel alloc] init];
    _functionNameLabel.font = FFNormalFont;
    _functionNameLabel.textColor = FFDarkColor;
    _arrowImgView = [[UIImageView alloc] init];
    _separatorView = [[UIView alloc] init];
    
    [self.contentView addSubview:_functionIconView];
    [self.contentView addSubview:_functionNameLabel];
    [self.contentView addSubview:_arrowImgView];
    [self.contentView addSubview:_separatorView];
    
}

- (CGFloat)getHeight {
    CGFloat result = 14.5 + 14 + 14 + 0.5;
    
    return result;
}

@end
