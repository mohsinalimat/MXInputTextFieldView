//
//  ViewController.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "ViewController.h"
#import "MXTextFieldManager.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) UISwitch *sw;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MXInputTextFieldView";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section][@"data"] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.dataSource[section][@"title"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (indexPath.section != self.dataSource.count - 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryView = self.sw;
    }
    cell.textLabel.text = self.dataSource[indexPath.section][@"data"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != self.dataSource.count - 1) {
        SecondViewController *vc = [[SecondViewController alloc]init];
        vc.indexPath = indexPath;
        vc.title = self.dataSource[indexPath.section][@"data"][indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)changeSwitch {
    [MXTextFieldManager sharedInstance].hideKeyboardTouchOutside = self.sw.on;
}

- (NSArray *)dataSource {
    NSArray *section1 = @[@"带确认按钮",@"带图标",@"带标题(动画)",@"带图标、标题(动画)"];
    NSArray *section2 = @[@"限制输入长度、并回调",@"结束编辑回调",@"Return键回调"];
    NSArray *section3 = @[@"点击空白区域收起键盘"];
    NSDictionary *dict1 = @{@"title": @"样式", @"data": section1};
    NSDictionary *dict2 = @{@"title": @"事件", @"data": section2};
    NSDictionary *dict3 = @{@"title": @"键盘控制", @"data": section3};
    return @[dict1, dict2, dict3];
}

- (UISwitch *)sw {
    if (!_sw) {
        _sw = [[UISwitch alloc]init];
        [_sw addTarget:self action:@selector(changeSwitch) forControlEvents:UIControlEventValueChanged];
    }
    return _sw;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
