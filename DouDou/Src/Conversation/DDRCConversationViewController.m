//
//  DDRCConversationViewController.m
//  DouDou
//
//  Created by echo on 2016/10/27.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import "DDRCConversationViewController.h"
#import "DDContactInfoViewController.h"

@interface DDRCConversationViewController ()

@end

@implementation DDRCConversationViewController
{
    DDContactInfoViewController *contactInfoVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayUserNameInCell = NO;
    
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList = @[@(ConversationType_PRIVATE), @(ConversationType_SYSTEM)];
}

- (void)viewWillAppear:(BOOL)animated {
    
    // 添加 直播间
    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"moreKB_video_call"] title:@"直播间" tag:2001];
    // 移除 位置
    [self.chatSessionInputBarControl.pluginBoardView removeItemWithTag:PLUGIN_BOARD_ITEM_LOCATION_TAG];
}

#pragma mark - RCChatSessionInputBarControlDelegate
-(void)pluginBoardView:(RCPluginBoardView*)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    
    [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
    
    if (tag == 2001) {
        NSLog(@"点击进入直播间了");
    }
}

#pragma mark - 重写
- (void)didTapCellPortrait:(NSString *)userId {
    // 跳转至 详细资料 页面
    contactInfoVC = [[DDContactInfoViewController alloc] initWithTargetId:self.targetId];
    [self.navigationController pushViewController:contactInfoVC animated:YES];
}


@end
