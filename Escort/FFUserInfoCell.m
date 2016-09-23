//
//  FFUserInfoCell.m
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFUserInfoCell.h"
#import "FFGlobalMacro.h"

@implementation FFUserInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (CGFloat)getHeigth {
    return 95;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect avartarImgFrame = CGRectMake(14, 14, 60, 60);
    
    CGSize nicknameSize = [_nicknameLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                            options:NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName:_nicknameLabel.font}
                                                            context:nil].size;
    CGRect nicknameFrame = CGRectMake(avartarImgFrame.origin.x + avartarImgFrame.size.width + 14, 22, nicknameSize.width, nicknameSize.height);
    
    CGSize escortNoSize = [_escortNoLabel.text boundingRectWithSize:CGSizeMake(FFScreenW, MAXFLOAT)
                                                            options:NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName:_escortNoLabel.font}
                                                            context:nil].size;
    CGRect escortNoFrame = CGRectMake(avartarImgFrame.origin.x + avartarImgFrame.size.width + 14, nicknameFrame.origin.y + nicknameFrame.size.height + 10, escortNoSize.width, escortNoSize.height);
    
    CGRect arrowImgFrame = CGRectMake(FFScreenW - 17.5, 0, 7.5, 13.5);
    
    CGRect separatorFrame = CGRectMake(0, avartarImgFrame.origin.y + avartarImgFrame.size.height + 12, FFScreenW, 9);
    
    _avatarImgView.frame = avartarImgFrame;
    _nicknameLabel.frame = nicknameFrame;
    _escortNoLabel.frame = escortNoFrame;
    _arrowImgView.frame = arrowImgFrame;
    _arrowImgView.center = CGPointMake(_arrowImgView.center.x, _avatarImgView.center.y);
    _separatorView.frame = separatorFrame;
}

- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _avatarImgView = [[UIImageView alloc] init];
    _avatarImgView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImgView.clipsToBounds = YES;
    _avatarImgView.layer.cornerRadius = 30;
    
    _nicknameLabel = [[UILabel alloc] init];
    _nicknameLabel.font = FFNormalFont;
    _nicknameLabel.textColor = FFNormalColor;
    
    _escortNoLabel = [[UILabel alloc] init];
    _escortNoLabel.font = FFNormalFont;
    _escortNoLabel.textColor = FFDarkColor;
    
    _arrowImgView = [[UIImageView alloc] init];
    
    _separatorView = [[UIView alloc] init];

    [self.contentView addSubview:_avatarImgView];
    [self.contentView addSubview:_nicknameLabel];
    [self.contentView addSubview:_escortNoLabel];
    [self.contentView addSubview:_arrowImgView];
    [self.contentView addSubview:_separatorView];
}

@end
