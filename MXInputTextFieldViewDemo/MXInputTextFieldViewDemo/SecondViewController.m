//
//  SecondViewController.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/13.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "SecondViewController.h"
#import "MXInputTextFieldView.h"

@interface SecondViewController ()
@property (strong, nonatomic) MXInputTextFieldView *tf;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MXTextFieldManager sharedInstance].hideKeyboardTouchOutside = YES;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.tf = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 250, 200, 45)];
    
    self.tf.placeholderColor = [UIColor colorWithWhite:1 alpha:0.7];
    self.tf.placeholderFont = [UIFont systemFontOfSize:15];
    self.tf.placeholder = @"请输入手机号码";
    
    self.tf.tintColor = [UIColor blackColor];
    
    self.tf.textColor = [UIColor blackColor];
    
    self.tf.clearMode = UITextFieldViewModeWhileEditing;
    
    self.tf.returnKeyType = UIReturnKeyNext;
    self.tf.returnHandler = ^{
        NSLog(@"点击了return按钮");
    };
    
    if (self.index == 0) {
        @MXWeakObj(self);
        self.tf.maxLimit = 8;
        self.tf.beyondMaxLimitHandler = ^(NSInteger maxLimit) {
            @MXStrongObj(self);
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"超出最大字数：%ld",maxLimit] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        };
    } else if (self.index == 1) {
        self.tf.hasSureButtonView = YES;
        self.tf.sureButtonTitle = @"搞事情";
        self.tf.sureButtonTitleColor = [UIColor orangeColor];
    } else if (self.index == 2) {
        self.tf.iconName = @"phone";
    } else if (self.index == 3) {
        self.tf.titleText = @"手机号";
        self.tf.titleTextColor = [UIColor blackColor];
        self.tf.titleFont = [UIFont systemFontOfSize:10];
    } else if (self.index == 4) {
        self.tf.iconName = @"phone";
        self.tf.titleText = @"手机号";
        self.tf.titleTextColor = [UIColor blackColor];
        self.tf.titleFont = [UIFont systemFontOfSize:10];
    }
    [self.view addSubview:_tf];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
