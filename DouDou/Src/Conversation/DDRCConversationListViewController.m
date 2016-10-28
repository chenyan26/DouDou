//
//  DDRCConversationListViewController.m
//  DouDou
//
//  Created by echo on 2016/10/27.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import "DDRCConversationListViewController.h"
#import "DDRCConversationViewController.h"

@interface DDRCConversationListViewController ()

@end

@implementation DDRCConversationListViewController

- (void)viewDidLoad {
    //重写显示相关的接口，必须先调用super，否则会屏蔽SDK默认的处理
    [super viewDidLoad];
    
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
//                                        @(ConversationType_DISCUSSION),
//                                        @(ConversationType_CHATROOM),
//                                        @(ConversationType_GROUP),
//                                        @(ConversationType_APPSERVICE),
//                                        @(ConversationType_SYSTEM)
                                        ]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
//    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
//                                          @(ConversationType_GROUP)]];
    
    [self setTitle:@"消息"];
    
    //自定义导航左右按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemPressed:)];
    [rightButton setTintColor:[UIColor whiteColor]];
    /*
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 6, 67, 23);
    UIImageView *backImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigator_btn_back"]];
    backImg.frame = CGRectMake(-10, 0, 22, 22);
    [backBtn addSubview:backImg];
    UILabel *backText = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 65, 22)];
    backText.text = @"退出";
    backText.font = [UIFont systemFontOfSize:15];
    [backText setBackgroundColor:[UIColor clearColor]];
    [backText setTextColor:[UIColor whiteColor]];
    [backBtn addSubview:backText];
    [backBtn addTarget:self action:@selector(leftBarButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    */
    self.navigationItem.rightBarButtonItem = rightButton;
    self.conversationListTableView.tableFooterView = [UIView new];
    
    //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
    [[RCIM sharedRCIM] setUserInfoDataSource:self];

}

#pragma mark - 重写
    //重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {

    DDRCConversationViewController *conversationVC = [[DDRCConversationViewController alloc] init];
//    conversationVC.conversationType = model.conversationType;
//    conversationVC.targetId = model.targetId;
    
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"test002";
    [conversationVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:conversationVC animated:YES];
}


/**
 *  重载右边导航按钮的事件
 *
 *  @param sender <#sender description#>
 */
-(void)rightBarButtonItemPressed:(id)sender
{
    /*
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType =ConversationType_PRIVATE;
    // 对方Id
    conversationVC.targetId = @"1"; //这里模拟自己给自己发消息，您可以替换成其他登录的用户的UserId
    conversationVC.userName = @"测试1";
    conversationVC.title = @"自问自答";
    [self.navigationController pushViewController:conversationVC animated:YES];
    */
}

/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
// 从数据库取
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion {
    //此处为了演示写了一个用户信息
    if ([@"12345678901" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"12345678901";
        user.name = @"test002";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }else if([@"2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2";
        user.name = @"测试2";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        return completion(user);
    }
}

@end
