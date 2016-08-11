//
//  DDRootViewController.m
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDRootViewController.h"

#import "DDNavigationViewController.h"

#import "DDContactsViewController.h"
#import "DDDialViewController.h"
#import "DDMoreViewController.h"

@interface DDRootViewController ()

@property (nonatomic, strong) DDContactsViewController *contactsVC;
@property (nonatomic, strong) DDDialViewController *dialVC;
@property (nonatomic, strong) DDMoreViewController *moreVC;

@end

@implementation DDRootViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_NAVBAR_COLOR];
    
    DDNavigationViewController *contactsNav = [[DDNavigationViewController alloc] initWithRootViewController:self.contactsVC];
    DDNavigationViewController *dialNav = [[DDNavigationViewController alloc] initWithRootViewController:self.dialVC];
    DDNavigationViewController *moreNav = [[DDNavigationViewController alloc] initWithRootViewController:self.moreVC];
    
    [self setViewControllers:@[contactsNav, dialNav, moreNav]];
}

#pragma mark - getters and setters

- (DDContactsViewController *)contactsVC
{
    if (_contactsVC == nil) {
        _contactsVC = [[DDContactsViewController alloc] init];
        [_contactsVC.tabBarItem setTitle:@"联系人"];
        [_contactsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_contactsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _contactsVC;
}

- (DDDialViewController *)dialVC
{
    if (_dialVC == nil) {
        _dialVC = [[DDDialViewController alloc] init];
        [_dialVC.tabBarItem setTitle:@"拨号"];
        [_dialVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_dialVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _dialVC;
}

- (DDMoreViewController *)moreVC
{
    if (_moreVC == nil) {
        _moreVC = [[DDMoreViewController alloc] init];
        [_moreVC.tabBarItem setTitle:@"更多"];
        [_moreVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_moreVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _moreVC;
}

@end
