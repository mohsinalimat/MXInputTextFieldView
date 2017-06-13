//
//  MXTextFieldManager.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MXTextField;
@interface MXTextFieldManager : NSObject

//点击外部取消键盘
@property (assign, nonatomic) BOOL hideKeyboardTouchOutside;
//记录当前处于活动状态的textField
@property (strong, nonatomic) MXTextField *currentTextField;
//记录上一个处于活动状态的textField
@property (strong, nonatomic) MXTextField *previousTextField;

+ (instancetype)sharedInstance;

@end
