//
//  DDContactsAPIManager.m
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContactsAPIManager.h"
#import "MJExtension.h"

static const NSString *kContactsBaseUrl = @"http://10.0.0.117:8080/voip-backend/api/";

//static const NSString *kContactsBaseUrl = @"http://localhost:8080/voip-backend/api/";

static const NSString *kPutContacts = @"putContacts";
static const NSString *kGetContacts = @"getContacts";

@implementation DDContactsAPIManager

+ (void)putContacts:(NSArray <DDContact *> *) contacts success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
	
    NSString *url = [(NSString *)kContactsBaseUrl stringByAppendingString:(NSString *)kPutContacts];

//    模型数组－>字典数组
    NSArray *dicArray = [DDContact mj_keyValuesArrayWithObjectArray:contacts];
    
//    转为json字符串
    NSString *str = [dicArray mj_JSONString];
    
    NSDictionary *param = @{@"contacts" : str};
    
    [self postWithUrl:url param:param resultClass:[DDJsonResponse class] success:success failure:failure];
}

+ (void)getContactsSuccess:(void (^)(DDContactsResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
	
    NSString *url = [(NSString *)kContactsBaseUrl stringByAppendingString:(NSString *)kGetContacts];
    
    [self postWithUrl:url param:nil resultClass:[DDContactsResponse class] success:success failure:failure];
}



@end
