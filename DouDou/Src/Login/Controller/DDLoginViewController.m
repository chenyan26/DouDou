//
//  DDLoginViewController.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDLoginViewController.h"
#import "DDRegisterViewController.h"
#import "DDForgetPwdViewController.h"
#import "DDLoginCellView.h"
#import <Masonry/Masonry.h>
#import "MBProgressHUD+CY.h"

#import "DDRootViewController.h"

@interface DDLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) DDLoginCellView *phoneView;
@property (nonatomic, weak) DDLoginCellView *pwdView;

@property (nonatomic, weak) UIButton *loginBtn;
@property (nonatomic, weak) UIButton *registerBtn;
@property (nonatomic, weak) UIButton *forgetPwdBtn;

@end

@implementation DDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"克拉豆豆"];
    self.view.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    
    DDLoginCellView *v1= [[DDLoginCellView alloc] init];
    _phoneView = v1;
    
    DDLoginCellView *v2= [[DDLoginCellView alloc] init];
    _pwdView = v2;
    _pwdView.textField.delegate = self;
    
    UIButton *button = [[UIButton alloc] init];
    _loginBtn = button;
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] init];
    _registerBtn = button1;
    [_registerBtn addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc] init];
    _forgetPwdBtn = button2;
    [_forgetPwdBtn addTarget:self action:@selector(forgetPwdClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_phoneView];
    [self.view addSubview:_pwdView];
    [self.view addSubview:_loginBtn];
    [self.view addSubview:_registerBtn];
    [self.view addSubview:_forgetPwdBtn];
    
    [self setupSubviews];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldWillChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - notifacation event

- (void)textFieldWillChange:(id)sender
{
    NSLog(@"textFieldWillChange");
    if (_phoneView.textField.text.length > 0 && _pwdView.textField.text.length > 0) {
        [_loginBtn setEnabled:YES];
    } else {
        [_loginBtn setEnabled:NO];
    }
}



#pragma mark - event response

- (void) loginClick:(id)sender
{
    //  TODO 封装MB
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    //就是dim的效果
    [hud setBackgroundColor:DEFAULT_DIM_COLOR];
    //所有 指示器 和 label 的颜色
    [hud setContentColor:[UIColor blackColor]];
    [hud.label setFont:[UIFont systemFontOfSize:14.0f]];
    [hud.label setText:@"正在连接服务器"];

    //    TODO 登录不在此跳转
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 10000 * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = [[DDRootViewController alloc] init];
        [hud setHidden:YES];
    });

}

- (void) registerClick:(id)sender
{
    [self.navigationController pushViewController:[[DDRegisterViewController alloc] init] animated:YES];
}

- (void) forgetPwdClick:(id)sender
{
    [self.navigationController pushViewController:[[DDForgetPwdViewController alloc] init] animated:YES];
}

#pragma mark - private methods

- (void) setupSubviews {
    
    //手机号
    [_phoneView.textField setKeyboardType:UIKeyboardTypePhonePad];
    
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(MARGIN_CELL + 64);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];

    [_phoneView setWithImageName:@"tabbar_me" andText:@"请输入手机号码"];
    
    //密码
    [_pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_phoneView.mas_bottom).with.offset(1.0f);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];
    
    [_pwdView setWithImageName:@"tabbar_me" andText:@"请输入密码"];
    
    //登录
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageWithColor:DEFAULT_NAVBAR_COLOR] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageWithColor:BUTTON_UNENABLE_COLOR] forState:UIControlStateDisabled];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_loginBtn setEnabled:NO];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pwdView.mas_bottom).with.offset(60);
        make.width.mas_equalTo(self.view.width - 50);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(BUTTON_HEIGHT);
    }];
    
    //注册
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    //    [_registerBtn setBackgroundColor:DEFAULT_NAVBAR_COLOR];
    [_registerBtn setTitleColor:BUTTON_BLUE_COLOR forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginBtn.mas_bottom).with.offset(20);
        make.left.mas_equalTo(30);
    }];
    
    //忘记密码
    [_forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
//    [_forgetPwdBtn setBackgroundColor:DEFAULT_NAVBAR_COLOR];
    [_forgetPwdBtn setTitleColor:BUTTON_BLUE_COLOR forState:UIControlStateNormal];
    [_forgetPwdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [_forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginBtn.mas_bottom).with.offset(20);
        make.right.mas_equalTo(-30);
    }];
    
}


#pragma mark - getters and setters


@end
