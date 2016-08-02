//
//  DDContactsViewController.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContactsViewController.h"
#import "DDContactsCell.h"
#import "DDMoreDefaultCell.h"

#import "DDContactsSearchViewController.h"

@interface DDContactsViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UIBarButtonItem *addContactBtn;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) DDContactsSearchViewController *searchVC;


@end

static const NSString *kDefaultCell = @"kDefaultCell";


@implementation DDContactsViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"豆豆视频电话"];
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
//    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
//    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
    [self.tableView registerClass:[DDMoreDefaultCell class] forCellReuseIdentifier:(NSString *)kDefaultCell];
    
    [self.navigationItem setRightBarButtonItem:self.addContactBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1 + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    } else{
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_DEFAULT_CELL;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DDMoreDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDefaultCell forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"新的朋友"];
                break;
            case 1:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机通讯录"];
                break;
            case 2:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机看家"];
                break;
            default:
                break;
        }
    }
    
    return cell;
}

#pragma mark - private methods



#pragma mark - UITabelViewDelegate

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
        _addContactBtn = [[UIBarButtonItem alloc] init];
        [_addContactBtn setImage:[UIImage imageNamed:@"barbuttonicon_add"]];
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

@end
