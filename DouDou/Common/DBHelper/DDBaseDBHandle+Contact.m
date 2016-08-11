//
//  DDBaseDBHandle+Contact.m
//  DouDou
//
//  Created by echo on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseDBHandle+Contact.h"

#import "FMDB.h"
#import "DDContact.h"

@implementation DDBaseDBHandle (Contact)

- (NSString *)databasePath
{
    return [PATH_DOCUMENT stringByAppendingPathComponent:(NSString *)SQLITEPATH];
}

- (BOOL)creatContactTable
{
    self.db = [FMDatabase databaseWithPath:[self databasePath]];
    
    if ([self.db open]) {
        
        return [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_contact (id integer PRIMARY KEY AUTOINCREMENT, number text NOT NULL, nickname text NOT NULL);"];
    } else {
        return false;
    }
}

- (BOOL)insertContact:(DDContact *)contact
{
    return [self.db executeUpdate:@"INSERT INTO t_contact (number, nickname) VALUES (?, ?);",
            contact.number, contact.nickname];
}

- (BOOL)deleteContactById:(NSString *)Id
{
    return [self.db executeUpdate:@"DELETE FROM t_contact WHERE id = ?", Id];
}

- (BOOL)updateContact:(DDContact *)contact ById:(NSString *)Id
{
    return  [self.db executeUpdate:@"UPDATE t_contact SET number = ?, nickname = ? WHERE id = ?", contact.number, contact.nickname, Id];
}

- (NSMutableArray *)selectAllContactFromContactTable
{
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM t_contact"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    while ([set next]) {
        NSString *number = [set stringForColumn:@"number"];
        NSString *nickname = [set stringForColumn:@"nickname"];
        
        DDContact *contact = [[DDContact alloc] init];
        contact.Id = [set intForColumn:@"id"];
        contact.number = number;
        contact.nickname = nickname;
        
        [array addObject:contact];
    }
    
    return array;
}

- (void)replaceAllContacts:(NSArray <DDContact *>*)contacts
{
    if ([self.db executeUpdate:@"DELETE FROM t_contact"]) {
        for (DDContact *contact in contacts) {
            [self insertContact:contact];
        }
    }
}

@end
