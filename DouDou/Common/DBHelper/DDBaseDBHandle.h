//
//  DDBaseDBHandle.h
//  DouDou
//
//  Created by ___chenyan___ on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

const static NSString *SQLITEPATH= @"doudou.sqlite";

@interface DDBaseDBHandle : NSObject

@property (nonatomic, strong) FMDatabase *db;

+ (DDBaseDBHandle *)shareDataBaseHandle;

@end
