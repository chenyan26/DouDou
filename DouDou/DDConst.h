//
//  DDConst.h
//  DouDou
//
//  Created by chenyan on 2016/10/20.
//  Copyright © 2016年 caratel. All rights reserved.
//

//#import "YYKit.h"
#import "Masonry.h"

//********************** LOG *************************//
#ifdef DEBUG
#define CYLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define CYLog(s, ... )
#endif

//********************** RGB颜色 *************************//
#define CYColor_RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#define CYColor_RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

//********************** 设备 *************************//
#define iPHone6Plus ([UIScreen mainScreen].bounds.size.height == 736) ? YES : NO

#define iPHone6 ([UIScreen mainScreen].bounds.size.height == 667) ? YES : NO

#define iPHone5 ([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO

#define iPHone4 ([UIScreen mainScreen].bounds.size.height == 480) ? YES : NO

//********************** 系统 *************************//
/** 系统状态栏高度 */
UIKIT_EXTERN CGFloat const kAppStatusBarHeight;
/** 系统导航栏高度 */
UIKIT_EXTERN CGFloat const kAppNavigationBarHeight;
/** 系统tabbar高度 */
UIKIT_EXTERN CGFloat const kAppTabBarHeight;

/** 系统间距字段 8 */
UIKIT_EXTERN CGFloat const kAppPadding_8;
/** 系统间距字段 12 */
UIKIT_EXTERN CGFloat const kAppPadding_12;
/** 系统间距字段 16 */
UIKIT_EXTERN CGFloat const kAppPadding_16;
/** 系统间距字段 20 */
UIKIT_EXTERN CGFloat const kAppPadding_20;
/** 系统间距字段 24 */
UIKIT_EXTERN CGFloat const kAppPadding_24;
/** 系统间距字段 28 */
UIKIT_EXTERN CGFloat const kAppPadding_28;
/** 系统间距字段 32 */
UIKIT_EXTERN CGFloat const kAppPadding_32;

//********************** Application常用字段Start *************************//
/** App启动次数 */
UIKIT_EXTERN NSString * const kAppLaunchTimes;
/** App的Appstore访问地址 */
UIKIT_EXTERN NSString * const kAppITunesURL;
//********************** Application常用字段End ***************************//


