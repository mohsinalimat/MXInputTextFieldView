//
//  MXInputTextFieldView.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

/*
 github:https://github.com/iamhmx
 */

#import <UIKit/UIKit.h>
#import "MXInputTextFieldHeader.h"
#import "MXTextFieldManager.h"

//键盘return按键事件
typedef void(^MXInputTextFieldReturnHandler)();

@interface MXInputTextFieldView : UIView

/*********Icon图标名*********/
//默认为nil
@property (copy, nonatomic) NSString *iconName;

/*********Placeholder*********/
//文本，默认为nil
@property (copy, nonatomic) NSString *placeholder;
//字体，默认fontsize为15
@property (strong, nonatomic) UIFont *placeholderFont;
//颜色，默认为gray，70% opacity
@property (strong, nonatomic) UIColor *placeholderColor;

/*********TextField*********/
//文本
@property (copy, nonatomic) NSString *text;
//字体
@property (strong, nonatomic) UIFont *font;
//文本颜色
@property (strong, nonatomic) UIColor *textColor;
//光标颜色
@property (strong, nonatomic) UIColor *tintColor;
//最大字数
@property (assign, nonatomic) NSInteger maxLimit;
//超出最大字数触发回调
@property (copy, nonatomic) void (^beyondMaxLimitHandler) (NSInteger maxLimit);
//结束编辑回调（一般用于内容校验）
@property (copy, nonatomic) void (^endEditHandler) (NSString *text);
//清除按钮模式
@property (assign, nonatomic) UITextFieldViewMode clearMode;
//激活键盘
@property (assign, nonatomic) BOOL activity;
//键盘模式
@property (assign, nonatomic) UIKeyboardType keyboardType;
//return键类型
@property (assign, nonatomic) UIReturnKeyType returnKeyType;
//return键事件
@property (copy, nonatomic) MXInputTextFieldReturnHandler returnHandler;
//开启键盘顶部视图，默认确定按钮
@property (assign, nonatomic) BOOL hasSureButtonView;
//设置确认按钮文本，默认“确定”
@property (copy, nonatomic) NSString *sureButtonTitle;
//设置确认按钮颜色，默认黑色
@property (strong, nonatomic) UIColor *sureButtonTitleColor;
//设置确认按钮字体
@property (strong, nonatomic) UIFont *sureButtonTitleFont;

/*********Title*********/
//文本，如果为空，没有动画
@property (copy, nonatomic) NSString *titleText;
//颜色，默认黑色
@property (strong, nonatomic) UIColor *titleTextColor;
//字体，默认fontsize为15
@property (strong, nonatomic) UIFont *titleFont;
//密码输入，默认为NO
@property (assign, nonatomic) BOOL isPassword;

/*********下划线*********/
//是否显示，默认为YES
@property (assign, nonatomic) BOOL showSubline;
//颜色，默认为白色，70%透明
@property (strong, nonatomic) UIColor *sublineColor;

@end
