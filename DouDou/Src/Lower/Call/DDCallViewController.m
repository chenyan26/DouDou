//
//  DDCallViewController.m
//  DouDou
//
//  Created by echo on 8/3/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDCallViewController.h"
#import <Masonry/Masonry.h>

@interface DDCallViewController ()

@property (nonatomic, weak) UIButton *hangupButton;

@end

@implementation DDCallViewController

#pragma mark - life cycle

- (instancetype)init
{
    if (self =[super init]){
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    UIButton *btn = [[UIButton alloc] init];
    _hangupButton = btn;
    [self.view addSubview:_hangupButton];
    
    [self setupSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomDelegate

#pragma mark - notifacation event

#pragma mark - event response

- (void)hangupButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - private methods

- (void)setupSubviews
{
    [_hangupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [_hangupButton setBackgroundColor:[UIColor redColor]];
    [_hangupButton setTitle:@"挂断" forState:UIControlStateNormal];
    [_hangupButton addTarget:self action:@selector(hangupButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - getters and setters


@end
