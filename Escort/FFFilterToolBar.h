//
//  FFFilterToolBar.h
//  FFEscort
//
//  Created by fanly frank on 9/6/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FFFilterToolBarDelegate <NSObject>

@optional
- (void)filterToolBarDidStarDesc;
- (void)filterToolBarDidStarAsc;

- (void)filterToolBarDidPriceDesc;
- (void)filterToolBarDidPriceAsc;

- (void)filterToolBarDidIntervalleDesc;
- (void)filterToolBarDidIntervalleAsc;

- (void)filterToolBarDidShowMoreFilter;

@end

@interface FFFilterToolBar : UIView

@property (weak, nonatomic) id<FFFilterToolBarDelegate> delegate;

@end
