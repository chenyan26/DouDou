//
//  DDBaseDBHandle+CallRecord.m
//  DouDou
//
//  Created by echo on 8/10/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseDBHandle+CallRecord.h"

#import "FMDB.h"
#import "DDCallRecord.h"

@implementation DDBaseDBHandle (CallRecord)

- (NSString *)databasePath
{
    return [PATH_DOCUMENT stringByAppendingPathComponent:(NSString *)SQLITEPATH];
}

- (BOOL)creatCallRecordTable
{
    self.db = [FMDatabase databaseWithPath:[self databasePath]];
    
    if ([self.db open]) {
        
        return [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_callrecord (id integer PRIMARY KEY AUTOINCREMENT, number text NOT NULL, nickname text NOT NULL, time text NOT NULL, callRecordType integer NOT NULL);"];
    } else {
        return false;
    }
}

- (BOOL)insertCallRecord:(DDCallRecord *)callRecord
{
//    return [self.db executeUpdate:@"INSERT INTO t_callrecord (number, nickname, time, callRecordType) VALUES (?, ?, ?, ?);", callRecord.number, callRecord.nickname, callRecord.time, callRecord.callRecordType];
    // FIXME 根据 callRecord.callRecordType 存数据库
    return [self.db executeUpdate:@"INSERT INTO t_callrecord (number, nickname, time, callRecordType) VALUES (?, ?, ?, 0);", callRecord.number, callRecord.nickname, callRecord.time];
}

- (BOOL)deleteCallRecordById:(NSString *)Id
{
    return [self.db executeUpdate:@"DELETE FROM t_callrecord WHERE id = ?", Id];
}

- (BOOL)clearCallRecord
{
    return [self.db executeUpdate:@"DELETE FROM t_callrecord"];
}

- (NSMutableArray *)selectAllCallRecordFromCallRecordTable
{
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM t_callrecord ORDER BY id DESC"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    while ([set next]) {
        NSString *number = [set stringForColumn:@"number"];
        NSString *nickname = [set stringForColumn:@"nickname"];
        NSDate *time = [set dateForColumn:@"time"];
        CallRecordType callRecordType = [set intForColumn:@"callRecordType"];
        
        DDCallRecord *callRecord = [[DDCallRecord alloc] init];
        callRecord.Id = [set intForColumn:@"id"];
        callRecord.number = number;
        callRecord.nickname = nickname;
        callRecord.time = time;
        callRecord.callRecordType = callRecordType;
        
        [array addObject:callRecord];
    }
    
    return array;
}

@end
