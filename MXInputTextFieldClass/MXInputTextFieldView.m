//
//  MXInputTextFieldView.m
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/7.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXInputTextFieldView.h"
#import <Masonry/Masonry.h>
#import "MXInputView.h"
#import "MXTextField.h"

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
        //添加观察者，刷新placeholder
        [self addObserver:self forKeyPath:@"refreshPlaceholder" options:NSKeyValueObservingOptionNew context:nil];
        //添加标题视图
        [self addSubview:self.titleLabel];
        //添加图标
        [self addSubview:self.iconImageView];
        //添加textField
        [self addSubview:self.textField];
        //添加下划线
        [self addSubview:self.subline];
    }
    return self;
}

#pragma mark Setter
- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    self.iconImageView.image = [UIImage imageNamed:iconName];
    //设置图片后，调整textfield位置
    self.textField.frame = CGRectMake(self.textFieldX, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.refreshPlaceholder = YES;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    //默认15号字体
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

- (void)setClearMode:(UITextFieldViewMode)clearMode {
    self.textField.clearBtnMode = clearMode;
}

- (void)setIsPassword:(BOOL)isPassword {
    self.textField.secureTextEntry = isPassword;
}

- (void)setMaxLimit:(NSInteger)maxLimit {
    _maxLimit = maxLimit < 0 ? 0 : maxLimit;
    [self.textField addTarget:self action:@selector(limitInput:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    self.textField.keyboardType = keyboardType;
}

- (void)setReturnKeyType:(UIReturnKeyType)returnKeyType {
    self.textField.returnKeyType = returnKeyType;
}

- (void)setHasSureButtonView:(BOOL)hasSureButtonView {
    self.textField.showInputView = hasSureButtonView;
}

- (void)setSureButtonTitle:(NSString *)sureButtonTitle {
    sureButtonTitle = sureButtonTitle.length > 0 ? sureButtonTitle : @"确定";
    self.textField.sureButtonTitle = sureButtonTitle;
}

- (void)setSureButtonTitleColor:(UIColor *)sureButtonTitleColor {
    sureButtonTitleColor = sureButtonTitleColor ? sureButtonTitleColor : [UIColor blackColor];
    self.textField.sureButtonColor = sureButtonTitleColor;
}

- (void)setSureButtonTitleFont:(UIFont *)sureButtonTitleFont {
    if (!sureButtonTitleFont) {
        return;
    }
    self.textField.sureButtonFont = sureButtonTitleFont;
}

- (void)hideKeyboard:(UITapGestureRecognizer*)tap {
    self.activity = NO;
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

#pragma mark Privite
- (void)limitInput:(MXTextField*)tf {
    if (tf.text.length > _maxLimit) {
        tf.text = [tf.text substringToIndex:_maxLimit];
        if (self.beyondMaxLimitHandler) {
            self.beyondMaxLimitHandler(_maxLimit);
        }
    }
}

#pragma mark Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, MXTitleLabelHeight, self.contentFrame.size.width, MXTitleLabelHeight)];
        _titleLabel.alpha = 0;
        //默认字体大小 15
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (self.contentFrame.size.height-MXIconWidthAndHeight)/2.0, MXIconWidthAndHeight, MXIconWidthAndHeight)];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (MXTextField *)textField {
    if (!_textField) {
        _textField = [[MXTextField alloc]initWithFrame:CGRectMake(self.textFieldX, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight)];
        _textField.delegate = self;
        _placeholderFont = [UIFont systemFontOfSize:15];
    }
    return _textField;
}

- (UIView *)subline {
    if (!_subline) {
        _subline = [[UIView alloc]initWithFrame:CGRectMake(0, self.contentFrame.size.height-0.5, self.contentFrame.size.width, 0.5)];
        _subline.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    }
    return _subline;
}

- (NSString *)text {
    return self.textField.text;
}

- (CGFloat)textFieldX {
    return self.iconName.length > 0 ? MXIconWidthAndHeight : 0;
}

- (CGFloat)textFieldHeight {
    return self.contentFrame.size.height - MXTitleLabelHeight;
}

- (CGFloat)textFieldWidth {
    return  self.contentFrame.size.width - (self.iconName.length > 0 ? MXIconWidthAndHeight : 0);
}

#pragma mark TextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [MXTextFieldManager sharedInstance].currentTextField = (MXTextField*)textField;
    if (!self.animation) {
        return;
    }
    [UIView animateWithDuration:MXAnimationDuration animations:^{
        [self showTitleLabel:YES];
        self.iconImageView.frame = CGRectMake(0, MXTitleLabelHeight+(self.contentFrame.size.height-MXTitleLabelHeight-MXIconWidthAndHeight)/2.0, MXIconWidthAndHeight, MXIconWidthAndHeight);
        self.textField.frame = CGRectMake(self.textFieldX, MXTitleLabelHeight+(self.contentFrame.size.height-MXTitleLabelHeight-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [MXTextFieldManager sharedInstance].previousTextField = (MXTextField*)textField;
    if (self.endEditHandler) {
        self.endEditHandler(textField.text);
    }
    if (!self.animation) {
        return;
    }
    [UIView animateWithDuration:MXAnimationDuration animations:^{
        [self showTitleLabel:NO];
        self.iconImageView.frame = CGRectMake(0, (self.contentFrame.size.height-MXIconWidthAndHeight)/2.0, MXIconWidthAndHeight, MXIconWidthAndHeight);
        self.textField.frame = CGRectMake(self.textFieldX, (self.contentFrame.size.height-self.textFieldHeight)/2.0, self.textFieldWidth, self.textFieldHeight);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.returnHandler) {
        self.returnHandler();
    }
    return YES;
}

//titleLabel动画，若title为空，无动画
- (void)showTitleLabel:(BOOL)show {
    if (show) {
        self.titleLabel.alpha = 1;
        self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.frame.size.width, MXTitleLabelHeight);
    } else {
        self.titleLabel.alpha = 0;
        self.titleLabel.frame = CGRectMake(0, MXTitleLabelHeight, self.titleLabel.frame.size.width, MXTitleLabelHeight);
    }
}

- (NSAttributedString *)placeholdrAtrStr {
    if (_placeholder && _placeholder.length > 0) {
        //如果设置了placeholder字体或者颜色，垂直居中
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

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"refreshPlaceholder"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
