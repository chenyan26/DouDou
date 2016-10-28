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

@interface DDRootViewController ()
@property (nonatomic, strong) DDRCConversationListViewController *conversationVC;
@property (nonatomic, strong) DDContactsViewController *contactsVC;
@end

@implementation DDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setBackgroundColor:[UIColor grayColor]];
    [self.tabBar setTintColor:[UIColor blueColor]];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:self.conversationVC];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:self.contactsVC];
    [self setViewControllers:@[nav1, nav2]];
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

@end
