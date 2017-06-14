//
//  MXInputView.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXInputView : UIView

@property (copy, nonatomic) void(^sureHandler)(void);

@property (copy, nonatomic) NSString *buttonTitle;

@property (strong, nonatomic) UIColor *buttonTitleColor;

@property (strong, nonatomic) UIFont *buttonTitleFont;

- (instancetype)initWithHandler:(void(^)(void))handler;

@end
