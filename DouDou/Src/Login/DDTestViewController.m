//
//  DDRegisterViewController.m
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDTestViewController.h"

@interface DDTestViewController ()

@property (weak, nonatomic) IBOutlet UITextField *testField;
@end

@implementation DDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"注册"];
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //键盘高度216
    int offset = self.view.height - 44 -216 - (textField.y + textField.height);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset < 0) {
        self.view.frame = CGRectMake(0.0f, offset, self.view.width, self.view.height);
    }
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.width, self.view.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
