//
//  AppDelegate.m
//  DouDou
//
//  Created by chenyan on 7/27/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "AppDelegate.h"

//#import "RTCPeerConnectionFactory.h"
#import <RongIMKit/RongIMKit.h>

#import "DDRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /**
     ************************************** 融云 *************************************
     */
    //初始化融云SDK
    [[RCIM sharedRCIM] initWithAppKey:@"mgb7ka1nbkrqg"];
    
    /**
     * 推送处理1
     */
    if ([application
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //注册推送, 用于iOS8以及iOS8之后的系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  UIUserNotificationTypeSound |
                                                                  UIUserNotificationTypeAlert)
                                                categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    
    //-----------------------------------
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector:@selector(didReceiveMessageNotification:)
//     name:RCKitDispatchMessageNotification
//     object:nil];
    //    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    
    //登录融云服务器,开始阶段可以先从融云API调试网站获取，之后token需要通过服务器到融云服务器取。
    NSString *token=@"Hc3OUYidfM8vP74qYOcXkt7vKmzAl4U73Scd9SCMNX7A7uo9fpS6VndgjZkuXf7gWEA2sIyv63NCkTAmripe2GQE7yt+0RE3";
//        NSString *token = @"KKEFbJBUOhJUPW+NqMAv7d7vKmzAl4U73Scd9SCMNX7A7uo9fpS6ViBELv5kng/qrko2RFj0XOlCkTAmripe2I0hGZqzNwEr";
    
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
    /**********************************************************************************/
    
    [self.window setRootViewController:[[DDRootViewController alloc] init]];
    
    /*
    DDAccount *account = [DDAccountTool account];
    if (account) {
        //已经有帐号
        //需要登录
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@0 forKey:LOGIN_STATE_KEY];
        [defaults synchronize];
        
        [DDAccountAPIManager signinWithAccount:account success:^(DDJsonResponse *resopnseObj) {
            //进入主界面
            if (resopnseObj.errcode == OK) {
                [defaults setObject:@1 forKey:LOGIN_STATE_KEY];
                [defaults synchronize];
            }
        } failure:^(NSError *error) {
        }];
        [DDControllerTool chooseRootViewController:RootControllerTypeRoot];
    } else {
        [DDControllerTool chooseRootViewController:RootControllerTypeLogin];
    }
     */
    
//    初始化 (Security Socket Layer 加密套接字协议层)
//    [RTCPeerConnectionFactory initializeSSL];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
//    [RTCPeerConnectionFactory deinitializeSSL];
}

/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}

/**
 * 推送处理3
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [[[[deviceToken description]
                         stringByReplacingOccurrencesOfString:@"<" withString:@""]stringByReplacingOccurrencesOfString:@">" withString:@""]stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}


//- (void)didReceiveMessageNotification:(NSNotification *)notification {
//    [UIApplication sharedApplication].applicationIconBadgeNumber =
//    [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
//}

@end
