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

//键盘return按键事件
typedef void(^MXInputTextFieldReturnHandler)();

@interface MXInputTextFieldView : UIView

/*********Icon图标名*********/
@property (copy, nonatomic) NSString *leftImageName;

/*********Placeholder*********/
//文本
@property (copy, nonatomic) NSString *placeholder;
//字体，默认fontsize为15
@property (strong, nonatomic) UIFont *placeholderFont;
//颜色
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

/*********Title*********/
//文本，如果为空，没有动画
@property (copy, nonatomic) NSString *titleText;
//颜色，默认黑色
@property (strong, nonatomic) UIColor *titleTextColor;
//字体，默认fontsize为15
@property (strong, nonatomic) UIFont *titleFont;
//密码输入
@property (assign, nonatomic) BOOL password;

/*********下划线*********/
//是否显示，默认为YES
@property (assign, nonatomic) BOOL showSubline;
//颜色，默认为白色，不透明
@property (strong, nonatomic) UIColor *sublineColor;

@end
