//
//  FFCollectionVC.m
//  FFEscort
//
//  Created by fanly frank on 9/9/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "FFCollectionVC.h"
#import "FFProjectCell.h"
#import "FFGlobalMacro.h"

static NSString *projectCellId = @"project-cell";

@interface FFCollectionVC () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation FFCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerClass:[FFProjectCell class] forCellReuseIdentifier:projectCellId];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:projectCellId];
    
    cell.decorationImgView.image = [UIImage imageNamed:@"Slice 1"];
    if (indexPath.row % 2 == 0) {
        [cell.mainImgView setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=1043860642,3742124680&fm=206&gp=0.jpg"]];
    }
    else {
        [cell.mainImgView setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=878410098,633976966&fm=206&gp=0.jpg"]];
    }
    
    [cell.functionBtn setImage:[UIImage imageNamed:@"heart－h"] forState:UIControlStateNormal];
    
    cell.titleLable.text = @"¥2000.00/人 星级5.0 行程7天";
    cell.subTitleLable.text = @"大巴上腹地亲子七日游，限期优惠，生态体验七日游。暑假给孩子一个难忘的回忆！";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:projectCellId];
    
    cell.titleLable.text = @"¥2000.00/人 星级5.0 行程7天";
    cell.subTitleLable.text = @"大巴上腹地亲子七日游，限期优惠，生态体验七日游。暑假给孩子一个难忘的回忆！";
    
    return [cell getHeight];
}

@end
