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
@property (strong, nonatomic) MXInputTextFieldView *tf3;
@property (strong, nonatomic) MXInputTextFieldView *tf4;
@property (strong, nonatomic) MXInputTextFieldView *tf5;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:62/255.0 green:143/255.0 blue:242/255.0 alpha:1];
    //self.view.backgroundColor = [UIColor brownColor];
    self.tf1 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50, 200, 45)];
    
    self.tf1.iconName = @"phone";
    
    self.tf1.placeholder = @"请输入手机号码";
    self.tf1.placeholderColor = [UIColor redColor];
    self.tf1.placeholderFont = [UIFont systemFontOfSize:15];
    
    self.tf1.titleText = @"手机号";
    self.tf1.titleTextColor = [UIColor redColor];
    self.tf1.titleFont = [UIFont systemFontOfSize:10];
    
    self.tf1.tintColor = [UIColor whiteColor];
    
    self.tf1.textColor = [UIColor whiteColor];
    self.tf1.returnKeyType = UIReturnKeyNext;
    self.tf1.returnHandler = ^{
        NSLog(@"点击了return按钮");
    };
    self.tf1.hasSureButtonView = YES;
    self.tf1.sureButtonTitleColor = [UIColor orangeColor];
    
    self.tf1.maxLimit = 8;
    
    [self.view addSubview:_tf1];
    
    self.tf2 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45, 200, 45)];
    
    self.tf2.iconName = @"password";
    
    self.tf2.placeholder = @"请输入密码";
    self.tf2.placeholderColor = [UIColor yellowColor];
    self.tf2.placeholderFont = [UIFont systemFontOfSize:15];
    
    self.tf2.tintColor = [UIColor whiteColor];
    
    self.tf2.textColor = [UIColor whiteColor];
    self.tf2.clearMode = UITextFieldViewModeWhileEditing;
    self.tf2.isPassword = YES;
    self.tf2.keyboardType = UIKeyboardTypeNumberPad;
    self.tf2.hasSureButtonView = YES;
    
    self.tf2.titleText = @"密码";
    self.tf2.titleFont = [UIFont systemFontOfSize:10];
    self.tf2.titleTextColor = [UIColor yellowColor];
    
    [self.view addSubview:_tf2];
    
    self.tf3 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45+45, 200, 45)];
    
    self.tf3.iconName = @"edit";
    
    self.tf3.placeholder = @"我没有动画";
    self.tf3.placeholderColor = [UIColor orangeColor];
    self.tf3.placeholderFont = [UIFont systemFontOfSize:15];
    
    self.tf3.tintColor = [UIColor whiteColor];
    
    self.tf3.textColor = [UIColor whiteColor];
    self.tf3.clearMode = UITextFieldViewModeWhileEditing;
    
    //不设置titleText，动画将消失
    //self.tf3.titleText = @"密码";
    self.tf3.titleFont = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:_tf3];
    
    self.tf4 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45+45+45, 200, 45)];
    
    self.tf4.placeholder = @"我没有图标";
    self.tf4.placeholderColor = [UIColor greenColor];
    self.tf4.placeholderFont = [UIFont systemFontOfSize:15];
    
    self.tf4.textColor = [UIColor whiteColor];
    //self.tf4.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.tf4.tintColor = [UIColor whiteColor];
    
    self.tf4.titleText = @"没有图标";
    self.tf4.titleTextColor = [UIColor greenColor];
    self.tf4.titleFont = [UIFont systemFontOfSize:10];
    
    [self.view addSubview:_tf4];
    
    self.tf5 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45+45+45+45, 200, 45)];
    
    self.tf5.placeholder = @"我什么都没有";
    self.tf5.placeholderColor = [UIColor lightGrayColor];
    self.tf5.placeholderFont = [UIFont systemFontOfSize:15];
    
    self.tf5.textColor = [UIColor whiteColor];
    //self.tf4.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.tf5.tintColor = [UIColor whiteColor];
    
    //self.tf5.titleText = @"没有图标";
    //self.tf5.titleTextColor = [UIColor greenColor];
    //self.tf5.titleFont = [UIFont systemFontOfSize:10];
    
    [self.view addSubview:_tf5];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tf1.activity = NO;
    self.tf2.activity = NO;
    self.tf3.activity = NO;
    self.tf4.activity = NO;
    self.tf5.activity = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
