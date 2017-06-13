//
//  MXTextField.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXTextField.h"
#import "MXTextFieldManager.h"
#import "MXInputView.h"
#import "MXInputTextFieldHeader.h"

@implementation MXTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addObserver:self forKeyPath:@"editOffestX" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

//修复有清除按钮时，文本和清楚按钮重叠问题
- (void)setClearBtnMode:(UITextFieldViewMode)clearBtnMode {
    _clearBtnMode = clearBtnMode;
    self.clearButtonMode = clearBtnMode;
    if (clearBtnMode == UITextFieldViewModeNever) {
        self.editOffestX = 0;
    } else {
        //存在清除按钮时，设置偏移量
        self.editOffestX = 20;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"editOffestX"]) {
        [self layoutSubviews];
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 2, 0, self.editOffestX));//CGRectInset(bounds, 2, 0);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 2, 0, self.editOffestX));//CGRectInset(bounds, 2, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 2, 0, self.editOffestX));//CGRectInset(bounds, 2, 0);
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setShowInputView:(BOOL)showInputView {
    if (showInputView) {
        @MXWeakObj(self);
        MXInputView *inputView = [[MXInputView alloc]initWithHandler:^{
            @MXStrongObj(self);
            [self resignFirstResponder];
        }];
        self.topView = inputView;
        self.inputAccessoryView = _topView;
    } else {
        self.inputAccessoryView = nil;
    }
}

- (void)setSureButtonTitle:(NSString *)sureButtonTitle {
    if (!_topView) {
        return;
    }
    self.topView.buttonTitle = sureButtonTitle;
}

- (void)setSureButtonColor:(UIColor *)sureButtonColor {
    if (!_topView) {
        return;
    }
    self.topView.buttonTitleColor = sureButtonColor;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"editOffestX"];
}

@end
