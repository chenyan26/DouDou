//
//  DDRootViewController.m
//  DouDou
//
//  Created by echo on 2016/10/28.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import "DDRootViewController.h"

#import "DDRCConversationListViewController.h"
#import "DDContactsViewController.h"
#import "DDMyViewController.h"

#import "DDNavigationViewController.h"

#import "DDContact.h"

@interface DDRootViewController ()
@property (nonatomic, strong) DDRCConversationListViewController *conversationVC;
@property (nonatomic, strong) DDContactsViewController *contactsVC;
@property (nonatomic, strong) DDMyViewController *myVC;

@end

@implementation DDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:[UIColor grayColor]];
    [self.tabBar setTintColor:DEFAULT_NAVBAR_COLOR];
    
    DDNavigationViewController *nav1 = [[DDNavigationViewController alloc] initWithRootViewController:self.conversationVC];
    DDNavigationViewController *nav2 = [[DDNavigationViewController alloc] initWithRootViewController:self.contactsVC];
    DDNavigationViewController *nav3 = [[DDNavigationViewController alloc] initWithRootViewController:self.myVC];
    [self setViewControllers:@[nav1, nav2, nav3]];
    
    // 创建 联系人 ，为了之后的测试
    DDContact *c1 = [[DDContact alloc] init];

    c1.userId = @"12345678901";
    c1.name = @"test002";
//    c1.portraitUri = ;
    
    c1.userId = @"12345678909";
    c1.name = @"test001";
    
    DDContact *c2 = [[DDContact alloc] init];
    c2.userId = @"12345678902";
    c2.name = @"test003";
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [DDContact createOrUpdateInRealm:realm withValue:c1];
    [DDContact createOrUpdateInRealm:realm withValue:c2];
    [realm commitWriteTransaction];
}

#pragma mark - getters and setters

- (DDRCConversationListViewController *)conversationVC
{
    if (_conversationVC == nil) {
        _conversationVC = [[DDRCConversationListViewController alloc] init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

- (DDContactsViewController *)contactsVC
{
    if (_contactsVC == nil) {
        _contactsVC = [[DDContactsViewController alloc] init];
        [_contactsVC.tabBarItem setTitle:@"通讯录"];
        [_contactsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_contactsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _contactsVC;
}

- (DDMyViewController *)myVC
{
    if (_myVC == nil) {
        _myVC = [[DDMyViewController alloc] init];
        [_myVC.tabBarItem setTitle:@"我的"];
        [_myVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_myVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _myVC;
}

@end
