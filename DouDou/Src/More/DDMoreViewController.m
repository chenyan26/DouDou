//
//  DDMoreViewController.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDMoreViewController.h"
#import "DDMoreDefaultCell.h"
#import "DDMoreImageCell.h"

#import "DDHighlightViewController.h"
#import "DDShareViewController.h"

@interface DDMoreViewController ()<UIAlertViewDelegate>

@end

static const NSString *kImageCell = @"kImageCell";
static const NSString *kDefaultCell = @"kDefaultCell";

@implementation DDMoreViewController

{
    DDHighlightViewController *highlightVC;
    DDShareViewController *shareVC;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"更多"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    
    [self.tableView setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self.tableView registerClass:[DDMoreDefaultCell class] forCellReuseIdentifier:(NSString *)kDefaultCell];
    [self.tableView registerClass:[DDMoreImageCell class] forCellReuseIdentifier:(NSString *)kImageCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1){
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        DDMoreImageCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kImageCell forIndexPath:indexPath];
        [cell setWithLeftImage:[UIImage imageNamed:@"tx01"] andText:@"2355860263"];
        
// TODO 设置头像 和 number 靠 model
        
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleFill];
        
        return cell;
    }else {
        DDMoreDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDefaultCell forIndexPath:indexPath];
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                [cell setWithLeftImageName:@"tabbar_mainframe" andText:@"更多精彩"];
                [cell setTopLineStyle:CellLineStyleFill];
                [cell setBottomLineStyle:CellLineStyleNone];
            } else {
                [cell setWithLeftImageName:@"tabbar_discover" andText:@"分享给朋友"];
                [cell setTopLineStyle:CellLineStyleDefault];
                [cell setBottomLineStyle:CellLineStyleFill];
                
            }
        } else {
            [cell setWithLeftImageName:@"tabbar_me" andText:@"退出登录"];
            [cell setTopLineStyle:CellLineStyleFill];
            [cell setBottomLineStyle:CellLineStyleFill];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return MARGIN_CELL;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, MARGIN_CELL)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return HEIGHT_IMAGE_CELL;
    }
    return HEIGHT_DEFAULT_CELL;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            highlightVC = [[DDHighlightViewController alloc] init];
            [self.navigationController pushViewController:highlightVC animated:YES];
        } else {
            shareVC = [[DDShareViewController alloc] init];
            [self.navigationController pushViewController:shareVC animated:YES];
        }
    }else if (indexPath.section == 2) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注销登录" message:@"确定注销登录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"确定注销登录");
    }
}


@end
