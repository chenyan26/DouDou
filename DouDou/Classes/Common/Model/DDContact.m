//
//  DDContact.m
//  DouDou
//
//  Created by echo on 2016/10/31.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import "DDContact.h"

@implementation DDContact

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    // 头像---默认
    // 测试
    return @{@"portraitUri":@"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008"};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+ (NSString *)primaryKey
{
    return @"userId";
}

@end
