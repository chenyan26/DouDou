//
//  DDAccountTool.m
//  DouDou
//
//  Created by ___chenyan___ on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDAccountTool.h"

#define DDAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation DDAccountTool

+ (void)save:(DDAccount *)account
{
	
    [NSKeyedArchiver archiveRootObject:account toFile:DDAccountFilePath];
}

+ (DDAccount *)account
{
    DDAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:DDAccountFilePath];
    return account;
}

+ (BOOL)removeAccount {
    
    BOOL result = NO;
    
    result = [[NSFileManager defaultManager] removeItemAtPath:DDAccountFilePath error:nil];
    
    return result;
}


@end
