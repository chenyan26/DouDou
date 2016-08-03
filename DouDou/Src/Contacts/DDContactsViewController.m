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

@interface DDContactsViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UIBarButtonItem *addContactBtn;
@property (nonatomic, strong) DDAddContactViewController *addVC;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) DDContactsSearchViewController *searchVC;


@end

static const NSString *kDefaultCell = @"kDefaultCell";
static const NSString *kContactsCell = @"kContactsCell";
static const NSString *kContactsHead = @"kContactsHead";


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
    [self.tableView registerClass:[DDContactsCell class] forCellReuseIdentifier:(NSString *)kContactsCell];
    
    [self.tableView registerClass:[DDContactsHeadView class] forHeaderFooterViewReuseIdentifier:(NSString *)kContactsHead];
    
    [self.navigationItem setRightBarButtonItem:self.addContactBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1 + 2;
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    } else {
        DDContactsHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)kContactsHead];
        [headView setTitle:@"K"];
        return headView;
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
            case 1:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机通讯录"];
                [cell setBottomLineStyle:CellLineStyleFill];
                break;
            case 2:
                [cell setWithLeftImageName:@"tabbar_meHL" andText:@"手机看家"];
                [cell setBottomLineStyle:CellLineStyleNone];
                break;
            default:
                break;
        }
        return cell;
    } else {
        DDContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kContactsCell forIndexPath:indexPath];
        [cell setWithLeftImageName:@"add_friend_icon_offical" andText:@"kiyola"];
        return cell;
    }
}

#pragma mark - private methods

#pragma mark - event response

- (void)addContactBtnClick
{
    [self.navigationController pushViewController:[[DDAddContactViewController alloc] init] animated:YES];
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

@end
