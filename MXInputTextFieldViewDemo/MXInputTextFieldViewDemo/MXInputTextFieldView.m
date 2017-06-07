//
//  MXInputTextFieldView.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXInputTextFieldView.h"
#import <Masonry/Masonry.h>

#define MXTitleLabelHeight 20

@interface MXTextField : UITextField
@property (assign, nonatomic) NSUInteger maxLimitNumber;
@property (strong, nonatomic) UIFont *placeholderFont;
@property (strong, nonatomic) UIColor *placeholderColor;
@end

@implementation MXTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setMaxLimitNumber:(NSUInteger)maxLimitNumber {
    [self setValue:@(maxLimitNumber) forKeyPath:@"LimitInput"];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end

@interface MXInputTextFieldView ()<UITextFieldDelegate>
@property (assign, nonatomic) CGRect contentFrame;
@property (assign, nonatomic) CGFloat textFieldHeight;
@property (assign, nonatomic) CGFloat textFieldWidth;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) MXTextField *textField;
@property (strong, nonatomic) UIView *subline;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation MXInputTextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentFrame = frame;        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, MXTitleLabelHeight)];
        self.titleLabel.alpha = 0;
        self.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (frame.size.height-18)/2.0, 18, 18)];
        [self addSubview:_iconImageView];
        
        self.textField = [[MXTextField alloc]initWithFrame:CGRectMake(20, (frame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight)];
        self.textField.delegate = self;
        self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:_textField];
        
        self.subline = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        self.subline.backgroundColor = [UIColor whiteColor];
        [self addSubview:_subline];
    }
    return self;
}

#pragma mark Setter
- (void)setLeftImageName:(NSString *)leftImageName {
    self.iconImageView.image = [UIImage imageNamed:leftImageName];
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.textField.placeholder = placeholder;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    self.textField.placeholderFont = placeholderFont;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.textField.placeholderColor = placeholderColor;
}

- (void)setText:(NSString *)text {
    self.textField.text = text;
}

- (void)setFont:(UIFont *)font {
    self.textField.font = font;
}

- (void)setTextColor:(UIColor *)textColor {
    self.textField.textColor = textColor;
}

- (void)setTintColor:(UIColor *)tintColor {
    self.textField.tintColor = tintColor;
}

- (void)setMaxLimit:(NSUInteger)maxLimit {
    self.textField.maxLimitNumber = maxLimit;
}

- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor {
    self.titleLabel.textColor = titleTextColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    self.titleLabel.font = titleFont;
}

- (void)setActivity:(BOOL)activity {
    if (activity) {
        [self.textField becomeFirstResponder];
    } else {
        [self.textField resignFirstResponder];
    }
}

- (void)setShowSubline:(BOOL)showSubline {
    self.subline.hidden = !showSubline;
}

- (void)setSublineColor:(UIColor *)sublineColor {
    self.subline.backgroundColor = sublineColor;
}

#pragma mark Getter
- (NSString *)text {
    return self.textField.text;
}

- (CGFloat)textFieldHeight {
    return self.contentFrame.size.height - MXTitleLabelHeight;
}

- (CGFloat)textFieldWidth {
    return  self.contentFrame.size.width - 20;
}

#pragma mark TextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.375 animations:^{
        self.titleLabel.alpha = 1;
        self.titleLabel.frame = CGRectMake(0, 0, 100, MXTitleLabelHeight);
        self.iconImageView.frame = CGRectMake(0, 20+(self.contentFrame.size.height-20-18)/2.0, 18, 18);
        self.textField.frame = CGRectMake(20, 20+(self.contentFrame.size.height-20-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.375 animations:^{
        self.titleLabel.alpha = 0;
        self.titleLabel.frame = CGRectMake(0, 20, 100, MXTitleLabelHeight);
        self.iconImageView.frame = CGRectMake(0, (self.contentFrame.size.height-18)/2.0, 18, 18);
        self.textField.frame = CGRectMake(20, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
