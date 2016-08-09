//
//  CYDataBaseHandle.m
//  DouDou
//
//  Created by ___chenyan___ on 8/7/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "CYDataBaseHandle.h"

#import "FMDB.h"
#import "DDContact.h"

@implementation CYDataBaseHandle

//   创建单例对象使其存在于静态区
static CYDataBaseHandle *handle = nil;

+ (CYDataBaseHandle *)shareDataBaseHandle
{
    @synchronized (self) {
        if (handle == nil) {
            handle = [[CYDataBaseHandle alloc] init];
        }
    }
    return handle;
}

- (NSString *)databasePath
{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"doudou.sqlite"];
}

- (BOOL)creatContactTable
{
    self.db = [FMDatabase databaseWithPath:[self databasePath]];
    
    if ([self.db open]) {
        
        return [self.db executeUpdate:@"create table if not exists Contact(id integer primary key autoincrement,number text,nickname text)"];
    } else {
        return false;
    }
}

- (BOOL)insertContact:(DDContact *)contact
{
//    return [self.db e]
}
//
//- (BOOL)deleteContactBycontactId:(NSString *)contactId
//{
//    
//}
//
//- (BOOL)updateContactBycontactId:(NSString *)contactId number:(NSString *)number andNickname:(NSString *)nickname
//{
//    
//}

//- (NSMutableArray *)selectAllContactFromContactTable
//{
//    
//}


- (void)dealloc
{
    self.db = nil;
}

@end
