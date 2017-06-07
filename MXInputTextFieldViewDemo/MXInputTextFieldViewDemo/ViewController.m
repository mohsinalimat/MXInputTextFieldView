//
//  ViewController.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "ViewController.h"
#import "MXInputTextFieldView.h"

@interface ViewController ()
@property (strong, nonatomic) MXInputTextFieldView *tf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.tf = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50, 200, 50)];
    self.tf.placeholder = @"请输入手机号码";
    self.tf.leftImageName = @"phone";
    self.tf.textColor = [UIColor greenColor];
    self.tf.titleText = @"手机号";
    self.tf.titleTextColor = [UIColor grayColor];
    self.tf.titleFont = [UIFont systemFontOfSize:13];
    [self.view addSubview:_tf];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tf.activity = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
