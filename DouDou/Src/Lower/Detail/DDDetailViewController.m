//
//  DDDetailViewController.m
//  DouDou
//
//  Created by echo on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDDetailViewController.h"
#import "Masonry.h"
#import "DDDetailCell.h"
#import "DDCallViewController.h"
#import "DDEditViewController.h"
#import "DDContact.h"

@interface DDDetailViewController ()<UITableViewDelegate, UITableViewDataSource, EditViewControllerDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) UIBarButtonItem *editButton;

@property (nonatomic, weak) UIButton *callButton;

@property (nonatomic, strong) DDContact *contact;

@end

static const NSString *kDetailCell = @"kDetailCell";

@implementation DDDetailViewController
{
    DDCallViewController *callVC;
    DDEditViewController *editVC;
}

- (instancetype)initWithContact:(DDContact *)contact
{
    if (self =[super init]){
        [self setHidesBottomBarWhenPushed:YES];
        _contact = contact;
    }
    return self;
}

- (void)viewDidLoad
{
    [self.navigationItem setRightBarButtonItem:self.editButton];
    
    UITableView *tv = [[UITableView alloc] init];
    _tableView = tv;
    [_tableView setFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView setTableFooterView:[[UIView alloc] init]];
    
    [_tableView registerClass:[DDDetailCell class] forCellReuseIdentifier:(NSString *)kDetailCell];
    
    UIButton *btn = [[UIButton alloc] init];
    _callButton = btn;
    [self.view addSubview:_callButton];
    
    [_callButton addTarget:self action:@selector(callButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [_callButton setImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [_callButton setBackgroundColor:[UIColor redColor]];
    [_callButton setTitle:@"拨打" forState:UIControlStateNormal];
    
    [_callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-100);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(100);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - tableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return HEIGHT_DEFAULT_CELL;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//}

#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    DDDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDetailCell];
    
    if (indexPath.row == 0) {
        [cell setWithLeftText:@"姓名" andText:_contact.nickname];
    } else {
        [cell setWithLeftText:@"号码" andText:_contact.number];
    }
    return cell;
}

#pragma mark - EditViewControllerDelegate

- (void)editViewControllerSavaBtn:(DDEditViewController *)editVC contact:(DDContact *)contact {
    _contact = contact;
    
    [self.tableView reloadData];
}

#pragma mark - event response

- (void)callButtonClick:(UIButton *)sender
{
    callVC = [[DDCallViewController alloc] initWithContact:_contact];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.navigationController pushViewController:callVC animated:YES];
}

- (void)editButtonClick
{
    editVC = [[DDEditViewController alloc] initWithContact:_contact];
    
    editVC.delegate = self;
    
    [self.navigationController pushViewController:editVC animated:YES];
}

#pragma mark - praivate method


#pragma mark - setter and getter

- (UIBarButtonItem *)editButton
{
    if (_editButton == nil) {
        _editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClick)];
        [_editButton setTintColor:[UIColor whiteColor]];
    }
    return _editButton;
}

@end
