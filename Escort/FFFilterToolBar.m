//
//  FFFilterToolBar.m
//  FFEscort
//
//  Created by fanly frank on 9/6/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFFilterToolBar.h"
#import "FFGlobalMacro.h"

typedef   NS_ENUM(NSInteger, FFFilterStarState) {
    FFFilterStarStateRandom,
    FFFilterStarStateDesc,
    FFFilterStarStateAsc,
};

typedef NS_ENUM(NSInteger, FFFilterPriceState) {
    FFFilterPriceStateRandom,
    FFFilterPriceStateDesc,
    FFFilterPriceStateAsc,
};

typedef NS_ENUM(NSInteger, FFFilterIntervalleState) {
    FFFilterIntervalleStateRandom,
    FFFilterIntervalleStateDesc,
    FFFilterIntervalleStateAsc,
};

@interface FFFilterToolBar ()

@property (strong, nonatomic) UIButton *starLevelBtn;

@property (strong, nonatomic) UIButton *priceBtn;

@property (strong, nonatomic) UIButton *intervalleBtn;

@property (strong, nonatomic) UIButton *moreFilterBtn;

@property (assign, nonatomic) FFFilterStarState starState;
@property (assign, nonatomic) FFFilterPriceState priceState;
@property (assign, nonatomic) FFFilterIntervalleState intervalleState;

@end

@implementation FFFilterToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        //self.backgroundColor = FFRandomColor;
        
        CGFloat btnWidth = (.7 * frame.size.width - 4 * 5) / 3;
        
        _starLevelBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, btnWidth, frame.size.height)];
        _starLevelBtn.titleLabel.font = FFSmallFont;
        [_starLevelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_starLevelBtn setTitle:@"星级" forState:UIControlStateNormal];
        [_starLevelBtn setImage:[UIImage imageNamed:@"sx"] forState:UIControlStateNormal];
        [_starLevelBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_starLevelBtn.imageView.frame.size.width - 2, 0, _starLevelBtn.imageView.frame.size.width + 2)];
        [_starLevelBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _starLevelBtn.titleLabel.bounds.size.width + 2, 0, -_starLevelBtn.titleLabel.bounds.size.width - 2)];
        [_starLevelBtn addTarget:self
                          action:@selector(starLevelBtnClick:)
                forControlEvents:UIControlEventTouchUpInside];
        
        _priceBtn = [[UIButton alloc] initWithFrame:CGRectMake(2 * 5 + btnWidth, 0, btnWidth, frame.size.height)];
        _priceBtn.titleLabel.font = FFSmallFont;
        [_priceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn setImage:[UIImage imageNamed:@"sx"] forState:UIControlStateNormal];
        [_priceBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_priceBtn.imageView.frame.size.width - 2, 0, _priceBtn.imageView.frame.size.width + 2)];
        [_priceBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _priceBtn.titleLabel.bounds.size.width + 2, 0, -_priceBtn.titleLabel.bounds.size.width - 2)];
        [_priceBtn addTarget:self
                      action:@selector(priceBtnClick:)
            forControlEvents:UIControlEventTouchUpInside];
        
        _intervalleBtn = [[UIButton alloc] initWithFrame:CGRectMake(3 * 5 + 2 * btnWidth, 0, btnWidth, frame.size.height)];
        _intervalleBtn.titleLabel.font = FFSmallFont;
        [_intervalleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_intervalleBtn setTitle:@"时长" forState:UIControlStateNormal];
        [_intervalleBtn setImage:[UIImage imageNamed:@"sx"] forState:UIControlStateNormal];
        [_intervalleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_intervalleBtn.imageView.frame.size.width - 2, 0, _intervalleBtn.imageView.frame.size.width + 2)];
        [_intervalleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _intervalleBtn.titleLabel.bounds.size.width + 2, 0, -_intervalleBtn.titleLabel.bounds.size.width - 2)];
        [_intervalleBtn addTarget:self
                           action:@selector(intervalleBtnClick:)
                 forControlEvents:UIControlEventTouchUpInside];
        
        _moreFilterBtn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - btnWidth, 0, btnWidth, frame.size.height)];
        _moreFilterBtn.titleLabel.font = FFSmallFont;
        [_moreFilterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moreFilterBtn setImage:[UIImage imageNamed:@"siftings"] forState:UIControlStateNormal];
        [_moreFilterBtn setImage:[UIImage imageNamed:@"siftings-h"] forState:UIControlStateSelected];
        [_moreFilterBtn addTarget:self
                           action:@selector(moreFilterBtnClick:)
                 forControlEvents:UIControlEventTouchUpInside];
        
        UIBlurEffect *blurEffect = [UIBlurEffect  effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *backView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        backView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        [self addSubview:backView];
        
        [self addSubview:_starLevelBtn];
        [self addSubview:_priceBtn];
        [self addSubview:_intervalleBtn];
        [self addSubview:_moreFilterBtn];
    }
    
    return  self;
}

- (void)starLevelBtnClick:(UIButton *)sender {
    
    if (sender.selected) {
        
        if (_starState == FFFilterStarStateAsc) {
            _starState = FFFilterStarStateDesc;
            [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidStarDesc)]) {
                [self.delegate filterToolBarDidStarDesc];
            }
        }
        
        else {
            _starState = FFFilterStarStateAsc;
            [sender setImage:[UIImage imageNamed:@"sx-u-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidStarAsc)]) {
                [self.delegate filterToolBarDidStarAsc];
            }
        }
        
    }
    
    else {
        
        [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
        sender.selected = YES;
        
        _starState = FFFilterStarStateDesc;
        if ([self.delegate respondsToSelector:@selector(filterToolBarDidStarDesc)]) {
            [self.delegate filterToolBarDidStarDesc];
        }
    }
}

- (void)priceBtnClick:(UIButton *)sender {
    
    if (sender.selected) {
        
        if (_priceState == FFFilterPriceStateAsc) {
            _priceState = FFFilterPriceStateDesc;
            [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidPriceDesc)]) {
                [self.delegate filterToolBarDidPriceDesc];
            }
        }
        
        else {
            _priceState = FFFilterPriceStateAsc;
            [sender setImage:[UIImage imageNamed:@"sx-u-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidPriceAsc)]) {
                [self.delegate filterToolBarDidPriceAsc];
            }
        }
    }
    
    else {
        
        [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
        sender.selected = YES;
        
        _priceState = FFFilterPriceStateDesc;
        if (self.delegate && [self.delegate respondsToSelector:@selector(filterToolBarDidPriceDesc)]) {
            [self.delegate filterToolBarDidPriceDesc];
        }
    }
}

- (void)intervalleBtnClick:(UIButton *)sender {
    
    if (sender.selected) {
        
        if (_intervalleState == FFFilterIntervalleStateAsc) {
            _intervalleState = FFFilterIntervalleStateDesc;
            [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidIntervalleDesc)]) {
                [self.delegate filterToolBarDidIntervalleDesc];
            }
        }
        
        else {
            _intervalleState = FFFilterIntervalleStateAsc;
            [sender setImage:[UIImage imageNamed:@"sx-u-h"] forState:UIControlStateSelected];
            if ([self.delegate respondsToSelector:@selector(filterToolBarDidIntervalleAsc)]) {
                [self.delegate filterToolBarDidIntervalleAsc];
            }
        }
    }
    
    else {
        
        [sender setImage:[UIImage imageNamed:@"sx-d-h"] forState:UIControlStateSelected];
        sender.selected = YES;
        
        _intervalleState = FFFilterIntervalleStateDesc;
        if ([self.delegate respondsToSelector:@selector(filterToolBarDidIntervalleDesc)]) {
            [self.delegate filterToolBarDidIntervalleDesc];
        }

    }

}

- (void)moreFilterBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
