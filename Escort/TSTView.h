//
//  TSTView.h
//  iPenYou
//
//  Created by fanly frank on 5/22/15.
//  Copyright (c) 2015 vbuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class TSTView;

@protocol TSTViewDataSource <NSObject>

@required
- (NSInteger)numberOfTabsInTSTView:(TSTView *)tstview;
- (NSString *)tstview:(TSTView *)tstview titleForTabAtIndex:(NSInteger)tabIndex;
- (UIView *)tstview:(TSTView *)tstview viewForSelectedTabIndex:(NSInteger)tabIndex;

@optional
- (UIView *)tstview:(TSTView *)tstview decorationViewForSelectedTabIndex:(NSInteger)tabIndex;

@end

@protocol TSTViewDelegate <NSObject>

@optional

- (UIColor *)tabViewBackgroundColorForTSTView:(TSTView *)tstview;
//- (UIColor *)highlightColorForTSTView:(TSTView *)tstview;
- (UIColor *)indicatorHighlightColorForTSTView:(TSTView *)tstview;
- (UIColor *)tabTitleHighlightColorForTSTView:(TSTView *)tstview;

- (UIColor *)normalColorForTSTView:(TSTView *)tstview;
- (UIColor *)normalColorForSeparatorInTSTView:(TSTView *)tstview;

- (CGFloat)heightForTabInTSTView:(TSTView *)tstview;
- (CGFloat)heightForTabSeparatorInTSTView:(TSTView *)tstview;
- (CGFloat)heightForSelectedIndicatorInTSTView:(TSTView *)tstview;
- (CGFloat)spaceForTopTabInTSTView:(TSTView *)tstview;
- (CGFloat)spaceForIndicatorToTitleInTSTView:(TSTView *)tstview;
- (UIEdgeInsets)edgeForDecorationViewInTSTView:(TSTView *)tstview;

- (UIFont *)fontForTabTitleInTSTView:(TSTView *)tstview;

- (void)tstview:(TSTView *)tstview didSelectedTabAtIndex:(NSInteger)tabIndex;
- (void)tstview:(TSTView *)tstview didContent:(UIView *)contentView AppearAtIndex:(NSInteger)tabIndex;

@end

@interface TSTView : UIView <UIScrollViewDelegate>

@property (assign, nonatomic) id <TSTViewDataSource> dataSource;
@property (assign, nonatomic) id <TSTViewDelegate> delegate;

- (void)registerReusableContentViewClass:(Class)contentViewClass;
- (id)dequeueReusableContentView;

- (NSString *)titleForSelectedTab;
- (NSInteger)indexForSelectedTab;
- (UIView *)viewForTabIndex:(NSInteger)index;

- (UIScrollView *)topTabViewInTSTView;

- (void)selectContentAtIndex:(NSInteger)index;


- (void)reloadData;

@end

