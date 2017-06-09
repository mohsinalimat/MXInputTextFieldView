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
@property (strong, nonatomic) MXInputTextFieldView *tf1;
@property (strong, nonatomic) MXInputTextFieldView *tf2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.tf1 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50, 200, 45)];
    
    self.tf1.leftImageName = @"phone";
    
    self.tf1.placeholder = @"请输入手机号码";
    self.tf1.placeholderColor = [UIColor yellowColor];
    self.tf1.placeholderFont = [UIFont systemFontOfSize:13];
    
    self.tf1.titleText = @"手机号";
    self.tf1.titleFont = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:_tf1];
    
    self.tf2 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45, 200, 45)];
    
    self.tf2.leftImageName = @"password";
    
    self.tf2.placeholder = @"请输入密码";
    
    self.tf2.textColor = [UIColor redColor];
    self.tf2.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.tf2.titleText = @"密码";
    self.tf2.titleTextColor = [UIColor grayColor];
    self.tf2.titleFont = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:_tf2];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tf1.activity = NO;
    self.tf2.activity = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
