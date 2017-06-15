//
//  UIView+MXUIViewExtral.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/13.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "UIView+MXUIViewExtral.h"
#import <objc/runtime.h>

static char const * const ExistTapGesKey = "existTapGes";

@implementation UIView (MXUIViewExtral)

- (void)setExistTapGes:(BOOL)existTapGes {
    objc_setAssociatedObject(self, ExistTapGesKey, @(existTapGes), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)existTapGes {
    return [objc_getAssociatedObject(self, ExistTapGesKey) boolValue];;
}

+ (UIView*)currentVisiableView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController *rootVC = window.rootViewController;
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController*)rootVC).visibleViewController.view;
    } else if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = ((UITabBarController*)rootVC).selectedViewController;
        if ([selectedVC isEqual:[UIViewController class]]) {
            return selectedVC.view;
        } else if ([selectedVC isEqual:[UINavigationController class]]) {
            return ((UINavigationController*)selectedVC).visibleViewController.view;
        }
    } else if ([rootVC isKindOfClass:[UIViewController class]]) {
        return rootVC.view;
    }
    return nil;
}
@end
