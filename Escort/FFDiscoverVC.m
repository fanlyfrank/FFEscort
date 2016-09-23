//
//  FFDiscoverVC.m
//  FFEscort
//
//  Created by fanly frank on 9/5/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "FFDiscoverVC.h"
#import "FFFilterToolBar.h"
#import "FFGlobalMacro.h"
#import "FFProjectCell.h"

static NSString *reuseCellId = @"project-cell";

@interface FFDiscoverVC () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) FFFilterToolBar *filterBar;

@property (assign, nonatomic) CGFloat preOffset;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FFDiscoverVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _preOffset = 0;
    
    _filterBar = [[FFFilterToolBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 25)];

    [self.view addSubview:_filterBar];
    
    _tableView.contentInset = UIEdgeInsetsMake(25, 0, 0, 0);
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(25, 0, 0, 0);
    [_tableView registerClass:[FFProjectCell class] forCellReuseIdentifier:reuseCellId];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = FFBackColor;
    self.view.backgroundColor = FFBackColor;
    

    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_tableView.mj_header endRefreshing];
    }];
    
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [_tableView.mj_footer endRefreshing];
    }];
}


#pragma mark - UITableView Datasource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    
    cell.decorationImgView.image = [UIImage imageNamed:@"Slice 1"];
    if (indexPath.row % 2 == 0) {
        [cell.mainImgView setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=1043860642,3742124680&fm=206&gp=0.jpg"]];
        [cell.functionBtn setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    }
    else {
        [cell.mainImgView setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=878410098,633976966&fm=206&gp=0.jpg"]];
        [cell.functionBtn setImage:[UIImage imageNamed:@"heart－h"] forState:UIControlStateNormal];
    }
    
    cell.titleLable.text = @"¥2000.00/人 星级5.0 行程7天";
    cell.subTitleLable.text = @"大巴上腹地亲子七日游，限期优惠，生态体验七日游。暑假给孩子一个难忘的回忆！";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    
    cell.titleLable.text = @"¥2000.00/人 星级5.0 行程7天";
    cell.subTitleLable.text = @"大巴上腹地亲子七日游，限期优惠，生态体验七日游。暑假给孩子一个难忘的回忆！";
    
    return [cell getHeight];
}
#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat currentOffset = scrollView.contentOffset.y;
    if (currentOffset >= 0 && currentOffset + scrollView.frame.size.height <= scrollView.contentSize.height) {
        _filterBar.hidden = currentOffset > _preOffset;
        _preOffset = currentOffset;
    }
    
}

@end
