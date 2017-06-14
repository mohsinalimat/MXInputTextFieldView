//
//  MXTextField.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXInputView;
@interface MXTextField : UITextField
@property (strong, nonatomic) UIFont *placeholderFont;
@property (strong, nonatomic) UIColor *placeholderColor;
@property (assign, nonatomic) CGFloat editOffestX;
@property (assign, nonatomic) UITextFieldViewMode clearBtnMode;
@property (assign, nonatomic) BOOL showInputView;
@property (strong, nonatomic) MXInputView *topView;
@property (copy, nonatomic)   NSString *sureButtonTitle;
@property (strong, nonatomic) UIColor *sureButtonColor;
@property (strong, nonatomic) UIFont *sureButtonFont;
@property (assign, nonatomic) NSInteger index;
@end
