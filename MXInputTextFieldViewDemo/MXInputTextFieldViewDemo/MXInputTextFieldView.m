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
#define MXIconWidthAndHeight 20
#define MXAnimationDuration 0.375

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

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 0);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 0);
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
@property (assign, nonatomic) CGFloat textFieldX;
@property (assign, nonatomic) CGFloat textFieldHeight;
@property (assign, nonatomic) CGFloat textFieldWidth;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) MXTextField *textField;
@property (strong, nonatomic) UIView *subline;
@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) BOOL animation;
@property (assign, nonatomic) BOOL refreshPlaceholder;
@end

@implementation MXInputTextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentFrame = frame;
        
        [self addObserver:self forKeyPath:@"refreshPlaceholder" options:NSKeyValueObservingOptionNew context:nil];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, MXTitleLabelHeight, frame.size.width, MXTitleLabelHeight)];
        self.titleLabel.alpha = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (frame.size.height-MXIconWidthAndHeight)/2.0, MXIconWidthAndHeight, MXIconWidthAndHeight)];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageView];
        
        self.textField = [[MXTextField alloc]initWithFrame:CGRectMake(self.textFieldX, (frame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight)];
        self.textField.delegate = self;
        self.placeholderFont = [UIFont systemFontOfSize:15];
        [self addSubview:_textField];
        
        self.subline = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        self.subline.backgroundColor = [UIColor whiteColor];
        [self addSubview:_subline];
    }
    return self;
}

#pragma mark Setter
- (void)setLeftImageName:(NSString *)leftImageName {
    _leftImageName = leftImageName;
    self.iconImageView.image = [UIImage imageNamed:leftImageName];
    //设置图片后，调整textfield位置
    self.textField.frame = CGRectMake(self.textFieldX, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.refreshPlaceholder = YES;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    self.refreshPlaceholder = YES;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.refreshPlaceholder = YES;
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

- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode {
    self.textField.clearButtonMode = clearButtonMode;
}

- (void)setPassword:(BOOL)password {
    self.textField.secureTextEntry = password;
}

- (void)setMaxLimit:(NSUInteger)maxLimit {
    self.textField.maxLimitNumber = maxLimit;
}

- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
    if (titleText && titleText.length > 0) {
        self.animation = YES;
    } else {
        self.animation = NO;
    }
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

- (CGFloat)textFieldX {
    return self.leftImageName.length > 0 ? MXIconWidthAndHeight : 0;
}

- (CGFloat)textFieldHeight {
    return self.contentFrame.size.height - MXTitleLabelHeight;
}

- (CGFloat)textFieldWidth {
    return  self.contentFrame.size.width - (self.leftImageName.length > 0 ? MXIconWidthAndHeight : 0);
}

#pragma mark TextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (!self.animation) {
        return;
    }
    [UIView animateWithDuration:MXAnimationDuration animations:^{
        [self showTitleLabel:YES];
        self.iconImageView.frame = CGRectMake(0, 20+(self.contentFrame.size.height-20-18)/2.0, 18, 18);
        self.textField.frame = CGRectMake(self.textFieldX, 20+(self.contentFrame.size.height-20-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (!self.animation) {
        return;
    }
    [UIView animateWithDuration:0.375 animations:^{
        [self showTitleLabel:NO];
        self.iconImageView.frame = CGRectMake(0, (self.contentFrame.size.height-18)/2.0, 18, 18);
        self.textField.frame = CGRectMake(self.textFieldX, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

- (void)showTitleLabel:(BOOL)show {
    if (show) {
        self.titleLabel.alpha = 1;
        self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.frame.size.width, MXTitleLabelHeight);
    } else {
        self.titleLabel.alpha = 0;
        self.titleLabel.frame = CGRectMake(0, 20, self.titleLabel.frame.size.width, MXTitleLabelHeight);
    }
}

- (NSAttributedString *)placeholdrAtrStr {
    if (_placeholder && _placeholder.length > 0) {
        //如果设置了placeholder字体或者颜色，居中
        if (_placeholderFont || _placeholderColor) {
            NSMutableDictionary *mDict = [NSMutableDictionary new];
            if (_placeholderFont) {
                NSMutableParagraphStyle *style = [self.textField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
                style.minimumLineHeight = self.textField.font.lineHeight - (self.textField.font.lineHeight - _placeholderFont.lineHeight) / 2.0;
                [mDict setObject:style forKey:NSParagraphStyleAttributeName];
                [mDict setObject:_placeholderFont forKey:NSFontAttributeName];
            }
            if (_placeholderColor) {
                [mDict setObject:_placeholderColor forKey:NSForegroundColorAttributeName];
            }
            NSAttributedString *aStr = [[NSAttributedString alloc] initWithString:_placeholder attributes:mDict];
            return aStr;
        } else {
            NSAttributedString *aStr = [[NSAttributedString alloc] initWithString:_placeholder];
            return aStr;
        }
    }
    return nil;
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"refreshPlaceholder"]) {
        self.textField.attributedPlaceholder = [self placeholdrAtrStr];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end