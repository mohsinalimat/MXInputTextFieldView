# MXInputTextFieldView
高度自定义TextField
## 功能
* 支持设置图标
* 支持设置placeholder字体、颜色
* 支持设置下划线
* 支持动画
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
@property (strong, nonatomic) MXInputTextFieldView *tf1;
@property (strong, nonatomic) MXInputTextFieldView *tf2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tf1 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50, 200, 45)];
    
    self.tf1.leftImageName = @"phone";
    
    self.tf1.placeholder = @"请输入手机号码";
    self.tf1.placeholderColor = [UIColor yellowColor];
    self.tf1.placeholderFont = [UIFont systemFontOfSize:13];
    
    self.tf1.titleText = @"手机号";
    self.tf1.titleFont = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:_tf1];
    
    self.tf2 = [[MXInputTextFieldView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2.0, 50+45, 200, 45)];
    
    self.tf2.leftImageName = @"password";
    
    self.tf2.placeholder = @"请输入密码";
    
    self.tf2.textColor = [UIColor redColor];
    self.tf2.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.tf2.titleText = @"密码";
    self.tf2.titleTextColor = [UIColor grayColor];
    self.tf2.titleFont = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:_tf2];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //隐藏键盘
    self.tf1.activity = NO;
    self.tf2.activity = NO;
}

@end
```
