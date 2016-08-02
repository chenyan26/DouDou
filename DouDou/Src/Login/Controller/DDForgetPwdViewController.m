//
//  DDForgetPwdViewController.m
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDForgetPwdViewController.h"
#import "DDLoginCellView.h"
#import <Masonry/Masonry.h>

@interface DDForgetPwdViewController ()<UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) DDLoginCellView *phoneView;
@property (nonatomic, weak) DDLoginCellView *verifyView;
@property (nonatomic, weak) DDLoginCellView *pwdView;
@property (nonatomic, weak) DDLoginCellView *rePwdView;

@property (nonatomic, weak) UIButton *verifyBtn;
@property (nonatomic, weak) UIButton *commitBtn;

@end

@implementation DDForgetPwdViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"忘记密码"];
    
    UIScrollView * sc = [[UIScrollView alloc] init];
    _scrollView = sc;
    _scrollView.delegate = self;
    
    DDLoginCellView *v1= [[DDLoginCellView alloc] init];
    _phoneView = v1;
    
    DDLoginCellView *v2= [[DDLoginCellView alloc] init];
    _verifyView = v2;
    
    UIButton *btn = [[UIButton alloc] init];
    _verifyBtn = btn;
    
    DDLoginCellView *v3= [[DDLoginCellView alloc] init];
    _pwdView = v3;
    
    DDLoginCellView *v4= [[DDLoginCellView alloc] init];
    _rePwdView = v4;
    
    UIButton *button = [[UIButton alloc] init];
    _commitBtn = button;
    
    [self.view addSubview:_scrollView];
    [_scrollView addSubview:_phoneView];
    [_scrollView addSubview:_verifyView];
    [_verifyView addSubview:_verifyBtn];
    [_scrollView addSubview:_pwdView];
    [_scrollView addSubview:_rePwdView];
    [_scrollView addSubview:_commitBtn];
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

#pragma mark - UITextFieldDelegate


#pragma mark - event response


#pragma mark - private methods

- (void) setupSubviews {
    
    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(_scrollView.width, 700);
    _scrollView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    
    [_scrollView setShowsVerticalScrollIndicator:NO];
    //滚动时，收键盘
    [_scrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];

    //手机号
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(MARGIN_CELL);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];
    [_phoneView.textField setKeyboardType:UIKeyboardTypeNumberPad];
    [_phoneView setWithImageName:@"tabbar_discover" andText:@"请输入手机号码"];
    
    //验证码
    [_verifyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_phoneView.mas_bottom).with.offset(1.0f);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];
    [_verifyView.textField setKeyboardType:UIKeyboardTypeNumberPad];
    [_verifyView setWithImageName:@"tabbar_discover" andText:@"请输入验证码"];
    
    //获取验证码
    [_verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verifyBtn setBackgroundColor:DEFAULT_NAVBAR_COLOR];
    
    [_verifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_verifyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [_verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_verifyView.textField);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(100);
    }];
    
    //密码
    [_pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_verifyView.mas_bottom).with.offset(MARGIN_CELL);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];
    [_pwdView setWithImageName:@"tabbar_discover" andText:@"请输入密码"];
    
    //再次输入密码
    [_rePwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_pwdView.mas_bottom).with.offset(1.0f);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
        make.width.equalTo(self.view);
    }];
    
    [_rePwdView setWithImageName:@"tabbar_discover" andText:@"请再次输入密码"];
    
    //label
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"设置6-16位密码，建议字母和数字组合"];
    [label setTextColor:DEFAULT_TEXT_GRAY_COLOR];
    [_scrollView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_rePwdView.mas_bottom).with.offset(5);
    }];
    
    //提交
    [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_commitBtn setBackgroundColor:DEFAULT_NAVBAR_COLOR];
    [_commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_commitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rePwdView.mas_bottom).with.offset(100);
        make.width.mas_equalTo(self.view.width - 100);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(BUTTON_HEIGHT);
    }];
}


#pragma mark - getters and setters


@end
