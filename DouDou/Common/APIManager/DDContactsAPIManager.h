//
//  DDContactsAPIManager.h
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseAPIManager.h"
#import "DDContact.h"

#import "DDContactsResponse.h"

@interface DDContactsAPIManager : DDBaseAPIManager

/**
 *  备份通讯录
 */
+ (void)putContacts:(NSArray <DDContact *> *) contacts success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  恢复通讯录
 */
+ (void)getContactsSuccess:(void (^)(DDContactsResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;

@end
