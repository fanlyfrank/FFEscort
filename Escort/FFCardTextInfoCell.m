//
//  FFCardTextInfoCell.m
//  FFEscort
//
//  Created by fanly frank on 9/20/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFCardTextInfoCell.h"
#import "FFGlobalMacro.h"

@interface FFCardTextInfoCell ()

@property (strong, nonatomic) UIView *separatorView;

@end

@implementation FFCardTextInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    CGRect cardIconFrame = CGRectMake(15.15, 13.75, 14.5, 14.5);
    
    CGSize cardNameSize = [_cardNameLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                            options:NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName:_cardNameLabel.font}
                                                            context:nil].size;
    CGRect cardNameFrame = CGRectMake(cardIconFrame.origin.x + cardIconFrame.size.width + 11.5, (42 - cardNameSize.height) / 2,
                                      cardNameSize.width, cardNameSize.height);
    
    CGSize cardInfoSize = [_cardInfoLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                            options:NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName:_cardInfoLabel.font}
                                                            context:nil].size;
    CGRect cardInfoFrame = CGRectMake(FFScreenW - 10 - 7.5 - 10 - cardInfoSize.width, (42 - cardInfoSize.height) / 2, cardInfoSize.width, cardInfoSize.height);
    CGRect arrowFrame = CGRectMake(FFScreenW - 10 - 7.5, 15, 7.5, 13.5);
    
    CGRect separatorFrame = CGRectMake(10, 41.5, FFScreenW - 20, 0.5);
    if (_needHideSeparator) {
        separatorFrame = CGRectZero;
    }
    
    _cardIconView.frame = cardIconFrame;
    _cardNameLabel.frame = cardNameFrame;
    _cardInfoLabel.frame = cardInfoFrame;
    _arrowImgView.frame = arrowFrame;
    _separatorView.frame = separatorFrame;
}

- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _cardIconView = [[UIImageView alloc] init];
    _cardIconView.contentMode = UIViewContentModeScaleAspectFill;
    _cardIconView.clipsToBounds = YES;
    
    _cardNameLabel = [[UILabel alloc] init];
    _cardNameLabel.textColor = FFNormalColor;
    _cardNameLabel.font = FFNormalFont;
    
    _cardInfoLabel = [[UILabel alloc] init];
    _cardInfoLabel.textColor = FFNormalColor;
    _cardInfoLabel.font = FFNormalFont;
    
    _arrowImgView = [[UIImageView alloc] init];
    _arrowImgView.contentMode = UIViewContentModeScaleAspectFill;
    _arrowImgView.clipsToBounds = YES;
    
    _separatorView = [[UIView alloc] init];
    _separatorView.backgroundColor = FFBackColor;
    
    [self.contentView addSubview:_cardIconView];
    [self.contentView addSubview:_cardNameLabel];
    [self.contentView addSubview:_cardInfoLabel];
    [self.contentView addSubview:_arrowImgView];
    [self.contentView addSubview:_separatorView];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorView.backgroundColor = separatorColor;
}

@end
