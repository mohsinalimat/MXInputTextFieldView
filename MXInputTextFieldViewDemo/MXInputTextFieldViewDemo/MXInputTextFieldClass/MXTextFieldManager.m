//
//  MXTextFieldManager.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXTextFieldManager.h"
#import "MXInputTextFieldView.h"
#import "MXTextField.h"
#import "MXInputTextFieldHeader.h"
#import "UIView+MXUIViewExtral.h"

@interface MXTextFieldManager()
//点击手势，用于点击空白区域隐藏键盘
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
//当前控制器的视图
@property (strong, nonatomic) UIView *currentView;
@end

static MXTextFieldManager *manager = nil;
@implementation MXTextFieldManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MXTextFieldManager alloc]init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addObserver:self forKeyPath:@"currentTextField" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"previousTextField" options:NSKeyValueObservingOptionNew context:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)keyboardWillShow {
    if (self.hideKeyboardTouchOutside) {
        if (!self.currentView.existTapGes) {
            [self.currentView addGestureRecognizer:self.tapGesture];
            self.currentView.existTapGes = YES;
        }
    } else {
        [self.currentView removeGestureRecognizer:self.tapGesture];
        self.currentView.existTapGes = NO;
    }
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    }
    return _tapGesture;
}

- (UIView *)currentView {
    return [UIView currentVisiableView];
}

- (void)setHideKeyboardTouchOutside:(BOOL)hideKeyboardTouchOutside {
    _hideKeyboardTouchOutside = hideKeyboardTouchOutside;
}

- (void)hideKeyboard {
    for (UIView *subView in self.currentView.subviews) {
        if ([subView isKindOfClass:[MXInputTextFieldView class]]) {
            ((MXInputTextFieldView*)subView).activity = NO;
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentTextField"]) {
        if (self.currentTextField.clearBtnMode != UITextFieldViewModeNever) {
            self.currentTextField.editOffestX = 20;
        }
    } else if ([keyPath isEqualToString:@"previousTextField"]) {
        if (self.previousTextField.clearBtnMode != UITextFieldViewModeNever) {
            self.previousTextField.editOffestX = 0;
        }
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"currentTextField"];
    [self removeObserver:self forKeyPath:@"previousTextField"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
