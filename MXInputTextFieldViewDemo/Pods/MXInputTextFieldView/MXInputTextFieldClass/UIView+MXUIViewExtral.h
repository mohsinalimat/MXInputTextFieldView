//
//  UIView+MXUIViewExtral.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/13.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MXUIViewExtral)
//来判断是否添加过tap手势
@property (assign, nonatomic) BOOL existTapGes;

+ (UIView*)currentVisiableView;

@end
