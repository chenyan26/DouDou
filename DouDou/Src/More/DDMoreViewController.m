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

#import "DDAccountTool.h"
#import "DDAccountAPIManager.h"
#import "DDControllerTool.h"
#import "DDContactsAPIManager.h"
#import "DDBaseDBHandle+Contact.h"
#import "MJExtension.h"

@interface DDMoreViewController ()

@property (nonatomic, strong) DDAccount *account;

@end

static const NSString *kImageCell = @"kImageCell";
static const NSString *kDefaultCell = @"kDefaultCell";

@implementation DDMoreViewController
{
    DDBaseDBHandle *handle;
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

        [cell setWithLeftImage:[UIImage imageNamed:@"tx01"] andText:self.account.number];
        
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleFill];
        
        return cell;
    }else {
        DDMoreDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDefaultCell forIndexPath:indexPath];
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                [cell setWithLeftImageName:@"tabbar_mainframe" andText:@"备份通讯录"];
                [cell setTopLineStyle:CellLineStyleFill];
                [cell setBottomLineStyle:CellLineStyleNone];
            } else {
                [cell setWithLeftImageName:@"tabbar_discover" andText:@"恢复通讯录"];
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

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
//            备份
            handle = [DDBaseDBHandle shareDataBaseHandle];
            NSMutableArray *contacts = [handle selectAllContactFromContactTable];
            
            [DDContactsAPIManager putContacts:contacts success:^(DDJsonResponse *resopnseObj) {
                if (resopnseObj.errcode == OK) {
                    [MBProgressHUD showShortMessage:@"备份成功"];
                } else {
                    [MBProgressHUD showShortMessage:@"备份失败，请检查网络"];
                }
            } failure:^(NSError *error) {
                [MBProgressHUD showShortMessage:@"备份失败，请检查网络"];
            }];
        } else {
//            恢复
            [DDContactsAPIManager getContactsSuccess:^(DDContactsResponse *resopnseObj) {
                if (!resopnseObj.errcode) {
                    handle = [DDBaseDBHandle shareDataBaseHandle];
                    NSArray<DDContact *> *arr = [DDContact mj_objectArrayWithKeyValuesArray:resopnseObj.contacts];
                    [handle replaceAllContacts:arr];
                    [MBProgressHUD showShortMessage:@"恢复成功"];
                } else {
                    [MBProgressHUD showShortMessage:@"恢复失败，请检查网络"];
                }
                
            } failure:^(NSError *error) {
                [MBProgressHUD showShortMessage:@"恢复失败，请检查网络"];
            }];
        }
    }else if (indexPath.section == 2) {
        
        __weak __typeof(self)weakSelf = self;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注销登录" message:@"确定注销登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [weakSelf signout];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:confirm];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - private methods

- (void) signout
{
    MBProgressHUD *hud = [MBProgressHUD showMessage:@"正在注销"];
    [DDAccountAPIManager signoutWithClient_id:self.account.client_id success:^(DDJsonResponse *resopnseObj) {
        
        [hud setHidden:YES];
        if (resopnseObj.errcode == OK) {
            
            [DDAccountTool removeAccount];
            
            [DDControllerTool chooseRootViewController:RootControllerTypeLogin];
        } else {
            [MBProgressHUD showShortMessage:@"注销失败"];
        }
    } failure:^(NSError *error) {
        [hud setHidden:YES];
        [MBProgressHUD showShortMessage:@"注销失败"];
    }];
}

#pragma mark - setter and getter

- (DDAccount *)account
{
    if (_account == nil) {
        _account = [DDAccountTool account];
    }
    return _account;
}

@end
