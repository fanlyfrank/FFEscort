//
//  FFMineVC.m
//  FFEscort
//
//  Created by fanly frank on 9/13/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>

#import "FFMineVC.h"
#import "FFGlobalMacro.h"
#import "FFUserInfoCell.h"
#import "FFUserFunctionCell.h"
#import "FFOrdersVC.h"
#import "FFUserCardVC.h"

static NSString *userInfoCellId = @"user-info-cell";
static NSString *userFuncCellId = @"user-func-cell";

@interface FFMineVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FFMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerClass:[FFUserInfoCell class] forCellReuseIdentifier:userInfoCellId];
    [_tableView registerClass:[FFUserFunctionCell class] forCellReuseIdentifier:userFuncCellId];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [self buildTableFooterView];
}

#pragma mark -- UITableViewDelegate & UItableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        FFUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:userInfoCellId];
        [cell.avatarImgView setImageWithURL:[NSURL URLWithString:@"http://tse1.mm.bing.net/th?&id=OIP.Mc8c03e62f78cbcad0969763649b6f50fo0&w=299&h=299&c=0&pid=1.9&rs=0&p=0&r=0"]];
        cell.nicknameLabel.text = @"fanly";
        cell.escortNoLabel.text = @"伴游ID fanly1987444@126.com";
        cell.arrowImgView.image = [UIImage imageNamed:@"right"];
        cell.separatorView.backgroundColor = FFBackColor;
        return cell;
    }
    
    else {
        FFUserFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:userFuncCellId];
        if (indexPath.row == 1) {
            cell.functionIconView.image = [UIImage imageNamed:@"t"];
            cell.functionNameLabel.text = @"退款";
            cell.isShowSeparator = YES;
        }
        else if (indexPath.row == 2) {
            cell.functionIconView.image = [UIImage imageNamed:@"od"];
            cell.functionNameLabel.text = @"订单";
            cell.isShowSeparator = YES;
        }
        else if (indexPath.row == 3) {
            cell.functionIconView.image = [UIImage imageNamed:@"mes"];
            cell.functionNameLabel.text = @"评论";
            cell.isShowSeparator = YES;
        }
        else {
            cell.functionIconView.image = [UIImage imageNamed:@"conte"];
            cell.functionNameLabel.text = @"常用联系人";
            cell.isShowSeparator = NO;
        }
        
        cell.separatorColor = FFBackColor;
        cell.arrowImgView.image = [UIImage imageNamed:@"right"];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        FFUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:userInfoCellId];
        return [cell getHeigth];
    }
    else {
        return 43;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        FFUserCardVC *userCardVC = [[FFUserCardVC alloc] init];
        userCardVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userCardVC animated:YES];
    }
    
    else if (indexPath.row == 2) {
        FFOrdersVC *ordersVC = [[FFOrdersVC alloc] init];
        ordersVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ordersVC animated:YES];
    }
}

#pragma mark - private methods
- (UIView *)buildTableFooterView {
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FFScreenW, 167)];
    footer.backgroundColor = [UIColor whiteColor];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, 5, FFScreenW, 9)];
    separator.backgroundColor = FFBackColor;
    
    UIButton *shareAppBtn = [[UIButton alloc] initWithFrame:CGRectMake(85, 72 + 5, FFScreenW - 170, 37.5)];
    shareAppBtn.backgroundColor = FFHighlightColor;
    shareAppBtn.layer.cornerRadius = 4;
    [shareAppBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shareAppBtn setTitle:@"分享APP给朋友" forState:UIControlStateNormal];
    shareAppBtn.titleLabel.font = FFBigFont;
    
    UIButton *loginOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(85, 129.5 + 5, FFScreenW - 170, 37.5)];
    loginOutBtn.backgroundColor = [UIColor whiteColor];
    loginOutBtn.layer.cornerRadius = 4;
    loginOutBtn.layer.borderWidth = .5;
    loginOutBtn.layer.borderColor = FFHighlightColor.CGColor;
    [loginOutBtn setTitleColor:FFHighlightColor forState:UIControlStateNormal];
    [loginOutBtn setTitle:@"退出当前账号" forState:UIControlStateNormal];
    loginOutBtn.titleLabel.font = FFBigFont;
    
    [footer addSubview:separator];
    [footer addSubview:shareAppBtn];
    [footer addSubview:loginOutBtn];
    
     return footer;
}

@end
