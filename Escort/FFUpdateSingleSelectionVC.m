//
//  FFUpdateSingleSelectionVC.m
//  FFEscort
//
//  Created by fanly frank on 9/21/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFUpdateSingleSelectionVC.h"
#import "FFGlobalMacro.h"

static NSString *normalCellId = @"normal-cell";

@interface FFUpdateSingleSelectionVC ()

@end

@implementation FFUpdateSingleSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:normalCellId];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = FFBackColor;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id data = _datas[indexPath.row];
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:normalCellId];
        cell.textLabel.font = FFNormalFont;
        cell.textLabel.textColor = FFNormalColor;
        cell.textLabel.text = data[@"value"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([data[@"hasMore"] boolValue]) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        else if ([self.selectedStr containsString:data[@"value"]]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
        else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        return cell;
    }
    
    else {
      
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:normalCellId];
        cell.textLabel.font = FFNormalFont;
        cell.textLabel.textColor = FFNormalColor;
        cell.textLabel.text = data;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([self.selectedStr containsString:data]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
        else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        return cell;

        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id data = _datas[indexPath.row];
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dicData = (NSDictionary *)data;
        if ([dicData[@"hasMore"] boolValue]) {
            FFUpdateSingleSelectionVC *nextLevelVC = [[FFUpdateSingleSelectionVC alloc] initWithStyle:UITableViewStyleGrouped];
            nextLevelVC.datas = dicData[@"cities"];
            nextLevelVC.title = dicData[@"value"];
            nextLevelVC.selectedStr = self.selectedStr;
            nextLevelVC.currentSelectedStr = data[@"value"];
            nextLevelVC.indexPath = self.indexPath;
            nextLevelVC.delegate = self.delegate;
            nextLevelVC.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:nextLevelVC animated:YES];
        }
        
        else {
            
            if (self.delegate &&
                [self.delegate respondsToSelector:@selector(updateSingleSelectionVCDidSelectValue:for:)]) {
                _currentSelectedStr = dicData[@"value"];
                [self.delegate updateSingleSelectionVCDidSelectValue:_currentSelectedStr for:_indexPath];
            }
        }
    }
    
    else {
        if (self.delegate &&
            [self.delegate respondsToSelector:@selector(updateSingleSelectionVCDidSelectValue:for:)]) {
            _currentSelectedStr = [NSString stringWithFormat:@"%@ %@", _currentSelectedStr, data];
            [self.delegate updateSingleSelectionVCDidSelectValue:self.currentSelectedStr for:self.indexPath];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"全部";
}

@end
