//
//  FFOrdersVC.m
//  FFEscort
//
//  Created by fanly frank on 9/14/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>

#import "FFOrdersVC.h"
#import "FFOrderCell.h"
#import "FFGlobalMacro.h"

#import "TSTView.h"

static NSString *orderCellId = @"order-cell";

@interface FFOrdersVC () <UITableViewDataSource, UITableViewDelegate, TSTViewDataSource, TSTViewDelegate>

@property (strong, nonatomic) TSTView *tstview;

@property (strong, nonatomic) NSArray *tabDatas;
@end

@implementation FFOrdersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"我的订单";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tabDatas = @[@"全部", @"待付款", @"已付款", @"已评价"];
    
    _tstview = [[TSTView alloc] initWithFrame:
                CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    [_tstview registerReusableContentViewClass:[UITableView class]];
    
    _tstview.dataSource = self;
    _tstview.delegate = self;
    
    [self.view addSubview:_tstview];
    
    [_tstview reloadData];
    
}

#pragma mark - TSTViewDataSource & TSTViewDelegate
- (NSInteger)numberOfTabsInTSTView:(TSTView *)tstview {
    return _tabDatas.count;
}

- (NSString *)tstview:(TSTView *)tstview titleForTabAtIndex:(NSInteger)tabIndex {
    return _tabDatas[tabIndex];
}

- (UIView *)tstview:(TSTView *)tstview viewForSelectedTabIndex:(NSInteger)tabIndex {
    UITableView *contentView = [tstview dequeueReusableContentView];
    if (!contentView) {
        contentView = [[UITableView alloc] init];
        
        contentView.delegate = self;
        contentView.dataSource = self;
        
        [contentView registerClass:[FFOrderCell class] forCellReuseIdentifier:orderCellId];
        contentView.separatorStyle = UITableViewCellSeparatorStyleNone;
        contentView.backgroundColor = FFBackColor;
    }
    return contentView;
}

- (UIColor *)indicatorHighlightColorForTSTView:(TSTView *)tstview {
    return FFHighlightColor;
}

- (UIColor *)tabTitleHighlightColorForTSTView:(TSTView *)tstview {
    return FFHighlightColor;
}

- (UIColor *)normalColorForTSTView:(TSTView *)tstview {
    return FFNormalColor;
}

- (UIColor *)normalColorForSeparatorInTSTView:(TSTView *)tstview {
    return FFDarkColor;
}

- (CGFloat)heightForTabInTSTView:(TSTView *)tstview {
    return 37.5;
}

- (CGFloat)heightForTabSeparatorInTSTView:(TSTView *)tstview {
    return .5;
}

- (CGFloat)heightForSelectedIndicatorInTSTView:(TSTView *)tstview {
    return 3;
}

- (CGFloat)spaceForTopTabInTSTView:(TSTView *)tstview {
    return FFScreenW * .15;
}

- (UIFont *)fontForTabTitleInTSTView:(TSTView *)tstview {
    return FFNormalFont;
}

#pragma mark - UITableViewDatasource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FFOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCellId];
    cell.createTimeLabel.text = @"2016-09-14";
    cell.showState = FFOrderCellShowStateWaitPay;
    [cell.productImgView setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=1043860642,3742124680&fm=206&gp=0.jpg"]];
    cell.productInfoLabel.text = @"大巴山腹地亲子7日游，给孩子一个难忘的回忆，亲近自然没有别这更好的机会了。也许这一辈子就这一次哦，还不赶紧来抢！！！！！！！！";
    cell.startTimeLabel.text = @"出行时间：2016-09-14 到 2016-09-21";
    cell.amountLabel.text = @"金额：6000.00¥";
    cell.countLabel.text = @"人次：3人次";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCellId];
    cell.createTimeLabel.text = @"2016-09-14";
    cell.showState = FFOrderCellShowStateWaitPay;
    cell.startTimeLabel.text = @"出行时间：2016-09-14 到 2016-09-21";
    cell.amountLabel.text = @"金额：6000.00¥";
    cell.countLabel.text = @"人次：3人次";
    
    return [cell getHeight];
}

@end
