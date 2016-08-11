//
//  DDBaseDBHandle+CallRecord.h
//  DouDou
//
//  Created by echo on 8/10/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseDBHandle.h"

@class DDCallRecord;

@interface DDBaseDBHandle (CallRecord)

- (BOOL)creatCallRecordTable;

- (BOOL)insertCallRecord:(DDCallRecord *)callRecord;

- (BOOL)deleteCallRecordById:(NSString *)Id;

- (BOOL)clearCallRecord;

- (NSMutableArray *)selectAllCallRecordFromCallRecordTable;

@end
