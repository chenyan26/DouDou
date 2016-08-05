//
//  DDAccount.m
//  DouDou
//
//  Created by ___chenyan___ on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDAccount.h"

@implementation DDAccount

- (instancetype)init
{
    if (self = [super init]) {
        UIDevice *myDevice = [UIDevice currentDevice];
        NSUUID *uuid = [myDevice identifierForVendor];
        [self setClient_id:uuid.UUIDString];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.client_id forKey:@"client_id"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super init]) {
        self.number = [aDecoder decodeObjectForKey:@"number"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.client_id = [aDecoder decodeObjectForKey:@"client_id"];
    }
    return self;
}

@end
