//
//  DDHighlightViewController.m
//  DouDou
//
//  Created by echo on 8/1/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDHighlightViewController.h"

@interface DDHighlightViewController ()

@end

@implementation DDHighlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"更多精彩"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init
{
    if (self =[super init]){
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
