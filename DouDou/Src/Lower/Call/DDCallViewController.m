//
//  DDCallViewController.m
//  DouDou
//
//  Created by echo on 8/3/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDCallViewController.h"
#import <Masonry/Masonry.h>
#import "DDContact.h"
#import "DDCallRecord.h"
#import "DDBaseDBHandle+CallRecord.h"

@interface DDCallViewController ()

@property (nonatomic, strong) DDContact *contact;

@property (nonatomic, weak) UILabel *numberLabel;
@property (nonatomic, weak) UILabel *noteLabel;

@property (nonatomic, weak) UIImageView *headImageView;

@property (nonatomic, weak) UIButton *muteButton;
@property (nonatomic, weak) UILabel *muteLabel;

@property (nonatomic, weak) UIButton *hangupButton;
@property (nonatomic, weak) UILabel *hangupLabel;

@property (nonatomic, weak) UIButton *handsfreeButton;
@property (nonatomic, weak) UILabel *handsfreeLabel;

@end

@implementation DDCallViewController
{
    DDBaseDBHandle *handle;
}

#pragma mark - life cycle

- (instancetype)initWithContact:(DDContact *)contact {
    if (self =[super init]){
        [self setHidesBottomBarWhenPushed:YES];
        _contact = contact;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    UILabel *label = [[UILabel alloc] init];
    _numberLabel = label;
    UILabel *label2 = [[UILabel alloc] init];
    _noteLabel = label2;
    //目前 无头像，全部使用 占用图像
    UIImageView *iv = [[UIImageView alloc] init];
    _headImageView = iv;
    
    UIButton *btn = [[UIButton alloc] init];
    _muteButton = btn;
    UILabel *label3 = [[UILabel alloc] init];
    _muteLabel = label3;
    
    UIButton *btn1 = [[UIButton alloc] init];
    _hangupButton = btn1;
    UILabel *label4 = [[UILabel alloc] init];
    _hangupLabel = label4;
    
    UIButton *btn2 = [[UIButton alloc] init];
    _handsfreeButton = btn2;
    UILabel *label5 = [[UILabel alloc] init];
    _handsfreeLabel = label5;
    
    [self.view addSubview:_numberLabel];
    [self.view addSubview:_noteLabel];
    [self.view addSubview:_headImageView];
    [self.view addSubview:_muteButton];
    [self.view addSubview:_muteLabel];
    [self.view addSubview:_hangupButton];
    [self.view addSubview:_hangupLabel];
    [self.view addSubview:_handsfreeButton];
    [self.view addSubview:_handsfreeLabel];
    
    [_muteButton addTarget:self action:@selector(muteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_hangupButton addTarget:self action:@selector(hangupButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_handsfreeButton addTarget:self action:@selector(handsfreeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomDelegate

#pragma mark - notifacation event

#pragma mark - event response

- (void)muteButtonClick:(UIButton *)sender
{
    
}

- (void)hangupButtonClick:(UIButton *)sender
{
    DDCallRecord *callRecord = [[DDCallRecord alloc] init];
    callRecord.number = _contact.number;
    
    if (_contact.nickname) {
        callRecord.nickname = _contact.nickname;
    } else {
        callRecord.nickname = @"未知号码";
    }
    
    // TODO 尚未进行 类型判别逻辑
    
    callRecord.callRecordType = CallRecordTypeSuccess;
    callRecord.time = [NSDate date];
    
    handle = [DDBaseDBHandle shareDataBaseHandle];
    [handle creatCallRecordTable];
    
    [handle insertCallRecord:callRecord];
    
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)handsfreeButtonClick:(UIButton *)sender
{
    
}

#pragma mark - private methods

- (void)setupSubviews
{
    // 号码label
    [_numberLabel setText:_contact.number];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(100);
    }];
    
    // 提示label
    [_noteLabel setText:@"正在拨号"];
    [_noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_numberLabel.mas_bottom).offset(20);
    }];
    
    // 头像
    [_headImageView setImage:[UIImage imageNamed:@"tabbar_meHL"]];
    [_headImageView setBackgroundColor:[UIColor whiteColor]];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
    }];
    
    // 静音
    [_muteButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [_muteButton setBackgroundImage:[UIImage imageWithColor:DEFAULT_NAVBAR_COLOR] forState:UIControlStateSelected];
    [_muteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_CELL);
        make.bottom.mas_equalTo(- 50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [_muteLabel setText:@"静音"];
    [_muteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_muteButton);
        make.top.equalTo(_muteButton.mas_bottom).with.offset(5);
    }];
    
    // 结束通话
    [_hangupButton setBackgroundColor:[UIColor redColor]];
    [_hangupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(_muteButton.mas_bottom);
        make.width.mas_equalTo(150);
        make.height.equalTo(_muteButton.mas_height);
    }];
    
    [_hangupLabel setText:@"结束通话"];
    [_hangupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_hangupButton);
        make.top.equalTo(_hangupButton.mas_bottom).with.offset(5);
    }];
    
    // 免提
    [_handsfreeButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [_handsfreeButton setBackgroundImage:[UIImage imageWithColor:DEFAULT_NAVBAR_COLOR] forState:UIControlStateSelected];
    [_handsfreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).with.offset(- MARGIN_CELL);
        make.bottom.equalTo(_muteButton.mas_bottom);
        make.width.mas_equalTo(50);
        make.height.equalTo(_muteButton.mas_height);
    }];
    
    [_handsfreeLabel setText:@"免提"];
    [_handsfreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_handsfreeButton);
        make.top.equalTo(_handsfreeButton.mas_bottom).with.offset(5);
    }];

}

#pragma mark - getters and setters


@end
