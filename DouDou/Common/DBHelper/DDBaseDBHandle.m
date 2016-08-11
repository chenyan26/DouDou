//
//  DDBaseDBHandle.m
//  DouDou
//
//  Created by ___chenyan___ on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseDBHandle.h"

@implementation DDBaseDBHandle

//   创建单例对象使其存在于静态区
static DDBaseDBHandle *handle = nil;

+ (DDBaseDBHandle *)shareDataBaseHandle
{
    @synchronized (self) {
        if (handle == nil) {
            handle = [[DDBaseDBHandle alloc] init];
        }
    }
    return handle;
}

- (void)dealloc
{
    self.db = nil;
}

@end
