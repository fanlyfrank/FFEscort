//
//  FFCardImgInfoCell.m
//  FFEscort
//
//  Created by fanly frank on 9/19/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFCardImgInfoCell.h"
#import "FFGlobalMacro.h"

@interface FFCardImgInfoCell ()

@property (strong, nonatomic) UIView *separatorView;

@end

@implementation FFCardImgInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    CGRect cardIconFrame = CGRectMake(15.15, 23.75, 14.5, 14.5);
    
    CGSize cardNameSize = [_cardNameLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                            options:NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName:_cardNameLabel.font}
                                                            context:nil].size;
    CGRect cardNameFrame = CGRectMake(cardIconFrame.origin.x + cardIconFrame.size.width + 11.5, (62 - cardNameSize.height) / 2,
                                      cardNameSize.width, cardNameSize.height);
    
    CGRect cardInfoFrame = CGRectMake(FFScreenW - 10 - 7.5 - 10 - 40, 11, 40, 40);
    CGRect arrowFrame = CGRectMake(FFScreenW - 10 - 7.5, 25, 7.5, 13.5);
    
    CGRect separatorFrame = CGRectMake(10, 61.5, FFScreenW - 20, 0.5);
    
    _cardIconView.frame = cardIconFrame;
    _cardNameLabel.frame = cardNameFrame;
    _cardInfoImgView.frame = cardInfoFrame;
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
    
    _cardInfoImgView = [[UIImageView alloc] init];
    _cardInfoImgView.contentMode = UIViewContentModeScaleAspectFill;
    _cardInfoImgView.clipsToBounds = YES;
    _cardInfoImgView.layer.cornerRadius = 20;
    _cardInfoImgView.backgroundColor = FFRandomColor;
    
    _arrowImgView = [[UIImageView alloc] init];
    _arrowImgView.contentMode = UIViewContentModeScaleAspectFill;
    _arrowImgView.clipsToBounds = YES;
    
    _separatorView = [[UIView alloc] init];
    _separatorView.backgroundColor = FFBackColor;
    
    [self.contentView addSubview:_cardIconView];
    [self.contentView addSubview:_cardNameLabel];
    [self.contentView addSubview:_cardInfoImgView];
    [self.contentView addSubview:_arrowImgView];
    [self.contentView addSubview:_separatorView];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorView.backgroundColor = separatorColor;
}

@end
