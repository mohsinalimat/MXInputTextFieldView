//
//  MXInputTextFieldView.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXInputTextFieldView : UIView

@property (copy, nonatomic) NSString *leftImageName;
/*placeholder*/
@property (copy, nonatomic) NSString *placeholder;
@property (strong, nonatomic) UIFont *placeholderFont;
@property (strong, nonatomic) UIColor *placeholderColor;
/*textField*/
@property (copy, nonatomic) NSString *text;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *tintColor;
@property (assign, nonatomic) NSUInteger maxLimit;
//激活键盘
@property (assign, nonatomic) BOOL activity;
/*title*/
@property (copy, nonatomic) NSString *titleText;
@property (strong, nonatomic) UIColor *titleTextColor;
@property (strong, nonatomic) UIFont *titleFont;
/*下划线*/
@property (assign, nonatomic) BOOL showSubline;
@property (strong, nonatomic) UIColor *sublineColor;
@end
