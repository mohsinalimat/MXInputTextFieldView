//
//  MXInputView.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXInputView.h"

@interface MXInputView ()
@property (strong, nonatomic) UIButton *sureBtn;
@end

@implementation MXInputView

- (instancetype)initWithHandler:(void(^)(void))handler {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.sureHandler = handler;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.frame = CGRectMake(0, 0, width, 40);
        
        [self addSubview:self.sureBtn];
        
        UIView *subline = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, width, 0.5)];
        subline.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:subline];
    }
    return self;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    [self.sureBtn setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    [self.sureBtn setTitleColor:buttonTitleColor forState:UIControlStateNormal];
}

- (void)setButtonTitleFont:(UIFont *)buttonTitleFont {
    self.sureBtn.titleLabel.font = buttonTitleFont;
}

- (void)sureBtnClicked {
    if (self.sureHandler) {
        self.sureHandler();
    }
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-70, 0, 70, 40);
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

@end
