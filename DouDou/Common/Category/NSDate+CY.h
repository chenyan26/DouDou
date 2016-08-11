//
//  NSDate+CY.h
//  DouDou
//
//  Created by echo on 8/10/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CY)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  返回 月－日 的字符串
 */
- (NSString *)stringWithMD;
/**
 *  返回 小时－分钟 的字符串
 */
- (NSString *)stringWithHS;
/**
 *  返回 年－月－日 的时间
 */
- (NSDate *)dateWithYMD;
/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

@end
