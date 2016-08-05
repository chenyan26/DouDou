//
//  DDAccountAPIManager.h
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseAPIManager.h"
#import "DDCodeResponse.h"
#import "DDAccount.h"

@interface DDAccountAPIManager : DDBaseAPIManager

/**
 *  获取验证码
 */
+ (void)vcodeWithNumber:(NSString *)number success:(void (^)(DDCodeResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  注册
 */
+ (void)signupWithNumber:(NSString *)number code:(NSString *)code password:(NSString *)password success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  重置密码
 */
+ (void)resetWithNumber:(NSString *)number code:(NSString *)code password:(NSString *)password success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  登录
 */
+ (void)signinWithAccount:(DDAccount *)account success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  注销登录
 */
+ (void)signoutWithClient_id:(NSString *)client_id success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure;


@end
