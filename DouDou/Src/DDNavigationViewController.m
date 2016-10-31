//
//  DDNavigationViewController.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDNavigationViewController.h"

@interface DDNavigationViewController ()

@end

@implementation DDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:DEFAULT_NAVBAR_COLOR];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    
    UIImage *img = [UIImage imageNamed:@"return_button"];
    
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationBar.backIndicatorImage = img;
    self.navigationBar.backIndicatorTransitionMaskImage = img;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
