//
//  FFUserCardVC.m
//  FFEscort
//
//  Created by fanly frank on 9/19/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>

#import "FFUserCardVC.h"
#import "FFCardImgInfoCell.h"
#import "FFCardTextInfoCell.h"

#import "FFAvatarPreviewVC.h"
#import "FFUpdateSingleTextVC.h"
#import "FFUpdateSingleSelectionVC.h"

#import "FFGlobalMacro.h"

static NSString *userCardCellId = @"user-card-cell";
static NSString *userCardTextCellId = @"user-card-text-cell";

@interface FFUserCardVC () <UITableViewDataSource, UITableViewDelegate, FFUpdateSingleTextVCDelegate, FFUpdateSingleSelectionVCDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *datas;

@end

@implementation FFUserCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的名片";
    self.view.backgroundColor = FFBackColor;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.backgroundColor = FFBackColor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[FFCardImgInfoCell class] forCellReuseIdentifier:userCardCellId];
    [_tableView registerClass:[FFCardTextInfoCell class] forCellReuseIdentifier:userCardTextCellId];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    _datas = [NSMutableArray arrayWithArray:@[[NSMutableArray arrayWithArray:@[@{@"icon":@"func-icon", @"name":@"头像", @"value":@"http://tse1.mm.bing.net/th?&id=OIP.Mc8c03e62f78cbcad0969763649b6f50fo0&w=299&h=299&c=0&pid=1.9&rs=0&p=0&r=0"},
               @{@"icon":@"func-nickname", @"name":@"昵称", @"value":@"Riku"},
               @{@"icon":@"func-id", @"name":@"伴游ID", @"value":@"Riku2016854"}]],
               
               [NSMutableArray arrayWithArray:@[@{@"icon":@"func-location", @"name":@"地区", @"value":@"广东 广州"},
               @{@"icon":@"func-gender", @"name":@"性别", @"value":@"女"}]]]];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *data = _datas[section];
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *data = _datas[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            FFCardImgInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:userCardCellId];
            cell.arrowImgView.image = [UIImage imageNamed:@"right"];
            cell.cardIconView.image = [UIImage imageNamed:data[@"icon"]];
            cell.cardNameLabel.text = data[@"name"];
            [cell.cardInfoImgView setImageWithURL:[NSURL URLWithString:data[@"value"]]];
            cell.separatorColor = FFBackColor;
            return cell;
        }
    }
    
    FFCardTextInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:userCardTextCellId];
    if (indexPath.section == 0 && indexPath.row == 2) {
        cell.arrowImgView.image = nil;
    } else {
        cell.arrowImgView.image = [UIImage imageNamed:@"right"];
    }
    cell.cardIconView.image = [UIImage imageNamed:data[@"icon"]];;
    cell.cardNameLabel.text = data[@"name"];;
    cell.cardInfoLabel.text = data[@"value"];
    cell.separatorColor = FFBackColor;
    if ((indexPath.section == 0 && indexPath.row == 2) ||
        (indexPath.section == 1 && indexPath.row == 1)) {
        cell.needHideSeparator = YES;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *data = _datas[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        FFAvatarPreviewVC *avatartVC = [[FFAvatarPreviewVC alloc] init];
        avatartVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:avatartVC animated:YES];
    }
    
    else if (indexPath.section == 0 && indexPath.row == 1){
        
        FFUpdateSingleTextVC *updateSingleTextVC = [[FFUpdateSingleTextVC alloc] init];
        updateSingleTextVC.originalText = data[@"value"];
        updateSingleTextVC.title = data[@"name"];
        updateSingleTextVC.hidesBottomBarWhenPushed = YES;
        updateSingleTextVC.delegate = self;
        updateSingleTextVC.indexPath = indexPath;
        
        [self.navigationController pushViewController:updateSingleTextVC animated:YES];
        
    }
    
    else if (indexPath.section == 1) {
        
        FFUpdateSingleSelectionVC *updateSingleSelectionVC = [[FFUpdateSingleSelectionVC alloc] initWithStyle:UITableViewStyleGrouped];
        updateSingleSelectionVC.title = data[@"name"];
        if (indexPath.row == 0) {
            updateSingleSelectionVC.datas = @[@{@"value":@"北京",@"hasMore":@1,@"cities":@[@"西城",@"东城",@"崇文",@"宣武",@"朝阳",@"海淀",@"丰台",@"石景山",@"门头沟",@"房山",@"通州",@"顺义",@"大兴",@"昌平",@"平谷",@"怀柔",@"密云",@"延庆"]},
            @{@"value":@"天津",@"hasMore":@1,@"cities":@[@"青羊",@"河东",@"河西",@"南开",@"河北",@"红桥",@"塘沽",@"汉沽",@"大港",@"东丽",@"西青",@"北辰",@"津南",@"武清",@"宝坻",@"静海",@"宁河",@"蓟县",@"开发区"]},
            @{@"value":@"河北",@"hasMore":@1,@"cities":@[@"石家庄",@"秦皇岛",@"廊坊",@"保定",@"邯郸",@"唐山",@"邢台",@"衡水",@"张家口",@"承德",@"沧州",@"衡水"]},
            @{@"value":@"山西",@"hasMore":@1,@"cities":@[@"太原",@"大同",@"长治",@"晋中",@"阳泉",@"朔州",@"运城",@"临汾"]},
            @{@"value":@"内蒙古",@"hasMore":@1,@"cities":@[@"呼和浩特",@"赤峰",@"通辽",@"锡林郭勒",@"兴安"]},
            @{@"value":@"辽宁",@"hasMore":@1,@"cities":@[@"大连",@"沈阳",@"鞍山",@"抚顺",@"营口",@"锦州",@"丹东",@"朝阳",@"辽阳",@"阜新",@"铁岭",@"盘锦",@"本溪",@"葫芦岛"]},
            @{@"value":@"吉林",@"hasMore":@1,@"cities":@[@"长春",@"吉林",@"四平",@"辽源",@"通化",@"延吉",@"白城",@"辽源",@"松原",@"临江",@"珲春"]},
            @{@"value":@"黑龙江",@"hasMore":@1,@"cities":@[@"哈尔滨",@"齐齐哈尔",@"大庆",@"牡丹江",@"鹤岗",@"佳木斯",@"绥化"]},
            @{@"value":@"上海",@"hasMore":@1,@"cities":@[@"浦东",@"杨浦",@"徐汇",@"静安",@"卢湾",@"黄浦",@"普陀",@"闸北",@"虹口",@"长宁",@"宝山",@"闵行",@"嘉定",@"金山",@"松江",@"青浦",@"崇明",@"奉贤",@"南汇"]},
            @{@"value":@"江苏",@"hasMore":@1,@"cities":@[@"南京",@"苏州",@"无锡",@"常州",@"扬州",@"徐州",@"南通",@"镇江",@"泰州",@"淮安",@"连云港",@"宿迁",@"盐城",@"淮阴",@"沐阳",@"张家港"]},
            @{@"value":@"浙江",@"hasMore":@1,@"cities":@[@"杭州",@"金华",@"宁波",@"温州",@"嘉兴",@"绍兴",@"丽水",@"湖州",@"台州",@"舟山",@"衢州"]},
            @{@"value":@"安徽",@"hasMore":@1,@"cities":@[@"合肥",@"马鞍山",@"蚌埠",@"黄山",@"芜湖",@"淮南",@"铜陵",@"阜阳",@"宣城",@"安庆"]},
            @{@"value":@"福建",@"hasMore":@1,@"cities":@[@"福州",@"厦门",@"泉州",@"漳州",@"南平",@"龙岩",@"莆田",@"三明",@"宁德"]},
            @{@"value":@"江西",@"hasMore":@1,@"cities":@[@"南昌",@"景德镇",@"上饶",@"萍乡",@"九江",@"吉安",@"宜春",@"鹰潭",@"新余",@"赣州"]},
            @{@"value":@"山东",@"hasMore":@1,@"cities":@[@"青岛",@"济南",@"淄博",@"烟台",@"泰安",@"临沂",@"日照",@"德州",@"威海",@"东营",@"荷泽",@"济宁",@"潍坊",@"枣庄",@"聊城"]},
            @{@"value":@"河南",@"hasMore":@1,@"cities":@[@"郑州",@"洛阳",@"开封",@"平顶山",@"濮阳",@"安阳",@"许昌",@"南阳",@"信阳",@"周口",@"新乡",@"焦作",@"三门峡",@"商丘"]},
            @{@"value":@"湖北",@"hasMore":@1,@"cities":@[@"武汉",@"襄樊",@"孝感",@"十堰",@"荆州",@"黄石",@"宜昌",@"黄冈",@"恩施",@"鄂州",@"江汉",@"随枣",@"荆沙",@"咸宁"]},
            @{@"value":@"湖南",@"hasMore":@1,@"cities":@[@"长沙",@"湘潭",@"岳阳",@"株洲",@"怀化",@"永州",@"益阳",@"张家界",@"常德",@"衡阳",@"湘西",@"邵阳",@"娄底",@"郴州"]},
            @{@"value":@"广东",@"hasMore":@1,@"cities":@[@"广州",@"深圳",@"东莞",@"佛山",@"珠海",@"汕头",@"韶关",@"江门",@"梅州",@"揭阳",@"中山",@"河源",@"惠州",@"茂名",@"湛江",@"阳江",@"潮州",@"云浮",@"汕尾",@"潮阳",@"肇庆",@"顺德",@"清远"]},
            @{@"value":@"广西",@"hasMore":@1,@"cities":@[@"南宁",@"桂林",@"柳州",@"梧州",@"来宾",@"贵港",@"玉林",@"贺州"]},
            @{@"value":@"海南",@"hasMore":@1,@"cities":@[@"海口",@"三亚"]},
            @{@"value":@"重庆",@"hasMore":@1,@"cities":@[@"渝中",@"大渡口",@"江北",@"沙坪坝",@"九龙坡",@"南岸",@"北碚",@"万盛",@"双桥",@"渝北",@"巴南",@"万州",@"涪陵",@"黔江",@"长寿"]},
            @{@"value":@"四川",@"hasMore":@1,@"cities":@[@"成都",@"达州",@"南充",@"乐山",@"绵阳",@"德阳",@"内江",@"遂宁",@"宜宾",@"巴中",@"自贡",@"康定",@"攀枝花"]},
            @{@"value":@"贵州",@"hasMore":@1,@"cities":@[@"贵阳",@"遵义",@"安顺",@"黔西南",@"都匀"]},
            @{@"value":@"云南",@"hasMore":@1,@"cities":@[@"昆明",@"丽江",@"昭通",@"玉溪",@"临沧",@"文山",@"红河",@"楚雄",@"大理"]},
            @{@"value":@"西藏",@"hasMore":@1,@"cities":@[@"拉萨",@"林芝",@"日喀则",@"昌都"]},
            @{@"value":@"陕西",@"hasMore":@1,@"cities":@[@"西安",@"咸阳",@"延安",@"汉中",@"榆林",@"商南",@"略阳",@"宜君",@"麟游",@"白河"]},
            @{@"value":@"甘肃",@"hasMore":@1,@"cities":@[@"兰州",@"金昌",@"天水",@"武威",@"张掖",@"平凉",@"酒泉"]},
            @{@"value":@"青海",@"hasMore":@1,@"cities":@[@"黄南",@"海南",@"西宁",@"海东",@"海西",@"海北",@"果洛",@"玉树"]},
            @{@"value":@"宁夏",@"hasMore":@1,@"cities":@[@"银川",@"吴忠"]},
            @{@"value":@"新疆",@"hasMore":@1,@"cities":@[@"乌鲁木齐",@"哈密",@"喀什",@"巴音郭楞",@"昌吉",@"伊犁",@"阿勒泰",@"克拉玛依",@"博尔塔拉"]},
            @{@"value":@"香港",@"hasMore":@1,@"cities":@[@"中西区",@"湾仔区",@"东区",@"南区",@"九龙-油尖旺区",@"九龙-深水埗区",@"九龙-九龙城区",@"九龙-黄大仙区",@"九龙-观塘区",@"新界-北区",@"新界-大埔区",@"新界-沙田区",@"新界-西贡区",@"新界-荃湾区",@"新界-屯门区",@"新界-元朗区",@"新界-葵青区",@"新界-离岛区"]},
            @{@"value":@"澳门",@"hasMore":@1,@"cities":@[@"花地玛堂区",@"圣安多尼堂区",@"大堂区",@"望德堂区",@"风顺堂区",@"嘉模堂区",@"圣方济各堂区",@"路氹城"]}];
        }
        else {
            updateSingleSelectionVC.datas = @[@{@"value":@"男", @"hasMore":@0, @"selected":@1},
                                              @{@"value":@"女", @"hasMore":@0, @"selected":@0}];
        }
        updateSingleSelectionVC.selectedStr = data[@"value"];
        updateSingleSelectionVC.hidesBottomBarWhenPushed = YES;
        updateSingleSelectionVC.indexPath = indexPath;
        updateSingleSelectionVC.delegate = self;
        
        [self.navigationController pushViewController:updateSingleSelectionVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 9;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 62;
        }
    }
    
    return 42;
}

#pragma mark -- self VC delegate
- (void)updateSingleTextVCDidUpdateTextTo:(NSString *)updateText for:(NSIndexPath *)indexPath {
    NSMutableDictionary *data =
    [NSMutableDictionary dictionaryWithDictionary:_datas[indexPath.section][indexPath.row]];
    [data setObject:updateText forKey:@"value"];
    
    _datas[indexPath.section][indexPath.row] = data;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.tableView reloadData];
}

- (void)updateSingleTextVCDidCancle {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateSingleSelectionVCDidSelectValue:(NSString *)value for:(NSIndexPath *)indexPath {
    NSMutableDictionary *data =
    [NSMutableDictionary dictionaryWithDictionary:_datas[indexPath.section][indexPath.row]];
    [data setObject:value forKey:@"value"];
    
    _datas[indexPath.section][indexPath.row] = data;
    
    [self.navigationController popToViewController:self animated:YES];
    
    [self.tableView reloadData];
}

@end
