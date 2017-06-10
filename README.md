# MXInputTextFieldView
高度自定义TextField
## 功能
* 支持设置图标
* 支持设置placeholder字体、颜色
* 支持设置下划线
* 支持动画
* 支持设置键盘类型、return键类型
* 支持设置return键事件
* 支持给键盘上方添加确定按钮
## 效果示例
* ![效果图](https://github.com/iamhmx/MXInputTextFieldView/blob/master/MXInputTextFieldViewDemo/screenshots/tf.gif)
## 使用说明
* 添加文件
    * 将MXInputTextFieldView.h、MXInputTextFieldView.m添加到项目中
* 添加代码
```objc
/*ViewController.m*/
#import "MXInputTextFieldView.h"

@interface ViewController ()
@property (strong, nonatomic) MXInputTextFieldView *tf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tf = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50, 200, 45)];
    //设置左icon
    self.tf.leftImageName = @"phone";
    //设置placeholder文本
    self.tf.placeholder = @"请输入手机号码";
    //设置placeholder颜色
    self.tf.placeholderColor = [UIColor yellowColor];
    //设置placeholder字体
    self.tf.placeholderFont = [UIFont systemFontOfSize:13];
    //设置title，若为空，则没有动画
    self.tf.titleText = @"手机号";
    //设置title字体
    self.tf.titleFont = [UIFont systemFontOfSize:13];
    //设置最大字数
    self.tf.maxLimit = 8;
    //设置return键类型
    self.tf.returnKeyType = UIReturnKeyNext;
    //设置点击return键事件
    self.tf.returnHandler = ^{
        NSLog(@"点击了return按钮");
    };
    //给键盘上方添加确定按钮
    self.tf.hasSureButtonView = YES;
    
    /*设置更多属性，参考MXInputTextFieldView.h*/
    
    [self.view addSubview:_tf];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //隐藏键盘
    self.tf.activity = NO;
}

@end
```
