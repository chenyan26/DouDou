//
//  AppDelegate.m
//  DouDou
//
//  Created by echo on 7/27/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "AppDelegate.h"

#import "DDNavigationViewController.h"
#import "DDLoginViewController.h"

#import "DDRootViewController.h"
#import "DDAccountTool.h"
#import "DDControllerTool.h"
#import "DDAccountAPIManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    DDLoginViewController *loginVC = [[DDLoginViewController alloc] init];
//    DDNavigationViewController *loginRootVC = [[DDNavigationViewController alloc] initWithRootViewController:loginVC];
//    [self.window setRootViewController:loginRootVC];
    
    
//    DDRootViewController *rootVC = [[DDRootViewController alloc] init];
//    [self.window setRootViewController:rootVC];
    
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
}

@end
