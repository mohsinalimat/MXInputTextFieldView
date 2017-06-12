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

@interface MXTextFieldManager()

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
    }
    return self;
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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
