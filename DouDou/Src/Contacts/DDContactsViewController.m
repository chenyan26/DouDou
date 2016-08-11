//
//  DDContactsViewController.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContactsViewController.h"

#import "DDMoreDefaultCell.h"
#import "DDContactsCell.h"
#import "DDContactsHeadView.h"

#import "DDContactsSearchViewController.h"
#import "DDAddContactViewController.h"
#import "DDContact.h"
#import "DDBaseDBHandle+Contact.h"
#import "DDDetailViewController.h"
#import "DDContactsDataHelper.h"

@interface DDContactsViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UIBarButtonItem *addContactBtn;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) DDContactsSearchViewController *searchVC;

// 数据源
@property (nonatomic, strong) NSMutableArray *contacts;
// 格式化的contact列表
@property (nonatomic, strong) NSMutableArray *formattedData;
// 拼音首字母列表
@property (nonatomic, strong) NSMutableArray *sectionList;

@end

static const NSString *kDefaultCell = @"kDefaultCell";
static const NSString *kContactsCell = @"kContactsCell";
static const NSString *kContactsHead = @"kContactsHead";


@implementation DDContactsViewController

{
    DDAddContactViewController *addVC;
    DDDetailViewController *detailVC;
    DDBaseDBHandle *handle;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"豆豆视频电话"];
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
    [self.tableView registerClass:[DDMoreDefaultCell class] forCellReuseIdentifier:(NSString *)kDefaultCell];
    [self.tableView registerClass:[DDContactsCell class] forCellReuseIdentifier:(NSString *)kContactsCell];
    
    [self.tableView registerClass:[DDContactsHeadView class] forHeaderFooterViewReuseIdentifier:(NSString *)kContactsHead];
    
    [self.navigationItem setRightBarButtonItem:self.addContactBtn];
    
    //数据源
    [self setContactData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setContactData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1 + _formattedData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
//        return 3;
        return 2;
    } else{
        NSArray *array = [_formattedData objectAtIndex:section - 1];
        return array.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_DEFAULT_CELL;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    } else {
        DDContactsHeadView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)kContactsHead];
        [view setTitle:[_sectionList objectAtIndex:section]];
        return view;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        DDMoreDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDefaultCell forIndexPath:indexPath];
        [cell setTopLineStyle:CellLineStyleNone];
        
        switch (indexPath.row) {
            case 0:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"新的朋友"];
                [cell setBottomLineStyle:CellLineStyleFill];
                break;
//            case 1:
//                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机通讯录"];
//                [cell setBottomLineStyle:CellLineStyleFill];
//                break;
            case 1:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机看家"];
                [cell setBottomLineStyle:CellLineStyleNone];
                break;
            default:
                break;
        }
        return cell;
    } else {
        DDContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kContactsCell forIndexPath:indexPath];
//        DDContact *contact = self.contacts[indexPath.row];
//        [cell setWithLeftImageName:@"add_friend_icon_offical" andText:contact.nickname];
//        return cell;
        NSArray *array = [_formattedData objectAtIndex:indexPath.section - 1];
        DDContact *contact = [array objectAtIndex:indexPath.row];
        [cell setWithLeftImageName:@"add_friend_icon_offical" andText:contact.nickname];
        
        [cell setTopLineStyle:CellLineStyleNone];
        
        if (indexPath.row == array.count - 1) {
            indexPath.section == _formattedData.count ? [cell setBottomLineStyle:CellLineStyleFill] :[cell setBottomLineStyle:CellLineStyleNone];
        }
        else {
            [cell setBottomLineStyle:CellLineStyleDefault];
        }
        
        return cell;
    }
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionList;
}

#pragma mark - private methods

- (void)setContactData
{
    _formattedData = [DDContactsDataHelper getContactsDataBy:self.contacts];
    _sectionList = [DDContactsDataHelper getContactsSectionBy:_formattedData];
}

#pragma mark - event response

- (void)addContactBtnClick
{
    addVC = [[DDAddContactViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}


#pragma mark - UITabelViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else {
        return MARGIN_CELL;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }
    } else {
        NSArray *array = [_formattedData objectAtIndex:indexPath.section -1];
        DDContact *contact = [array objectAtIndex:indexPath.row];
        detailVC = [[DDDetailViewController alloc] initWithContact:contact];
        
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
}

#pragma mark - getters and setters

- (UIBarButtonItem *)addContactBtn
{
    if (_addContactBtn == nil) {
        _addContactBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(addContactBtnClick)];
        [_addContactBtn setTintColor:[UIColor whiteColor]];
    }
    return _addContactBtn;
}

- (DDContactsSearchViewController *)searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[DDContactsSearchViewController alloc] init];
    }
    return _searchVC;
}

- (UISearchController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater:self.searchVC];
        
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setTintColor:DEFAULT_NAVBAR_COLOR];
        [_searchController.searchBar sizeToFit];
//        [_searchController.searchBar.layer setBorderWidth:0.5f];
//        [_searchController.searchBar.layer setBorderColor:[UIColor blueColor].CGColor];
    }
    return _searchController;
}

#pragma mark - getter and setter

- (NSMutableArray *)contacts
{
    handle = [DDBaseDBHandle shareDataBaseHandle];
    if (_contacts == nil) {
        [handle creatContactTable];
    }
    _contacts = [handle selectAllContactFromContactTable];
    return _contacts;
}

@end
