//
//  DDAccountAPIManager.m
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDAccountAPIManager.h"
#import "CYHTTPTool.h"
#import "MJExtension.h"

static const NSString *kAccountBaseUrl = @"http://10.0.0.117:8080/voip-backend/api/";

//static const NSString *kAccountBaseUrl = @"http://192.168.0.104:8080/voip-backend/api/";

//static const NSString *kAccountBaseUrl = @"http://localhost:8080/voip-backend/api/";

static const NSString *kVcodeUrl = @"vcode";
static const NSString *kSignupUrl = @"signup";
static const NSString *kResetUrl = @"reset";
static const NSString *kSigninUrl = @"signin";
static const NSString *kSignoutUrl = @"signout";

static const NSString *kGetClientId = @"getClientId";
static const NSString *kGetNumber = @"getNumber";

@implementation DDAccountAPIManager

+ (void)vcodeWithNumber:(NSString *)number success:(void (^)(DDCodeResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
    
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kVcodeUrl];
    
    NSDictionary *param = @{@"number": number};
    
    [self postWithUrl:url param:param resultClass:[DDCodeResponse class] success:success failure:failure];
}

+ (void)signupWithNumber:(NSString *)number code:(NSString *)code password:(NSString *)password success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
	
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kSignupUrl];
    
    NSDictionary *param = @{@"number": number,
                            @"code":code,
                            @"password":password};
    
    [self postWithUrl:url param:param resultClass:[DDJsonResponse class] success:success failure:failure];
}

+ (void)resetWithNumber:(NSString *)number code:(NSString *)code password:(NSString *)password success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure
{
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kResetUrl];
    
    NSDictionary *param = @{@"number": number,
                            @"code":code,
                            @"password":password};
    
    [self postWithUrl:url param:param resultClass:[DDJsonResponse class] success:success failure:failure];
}

+ (void)signinWithAccount:(DDAccount *)account success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure
{
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kSigninUrl];
    
    NSDictionary *param = [account mj_keyValues];
    
    [self postWithUrl:url param:param resultClass:[DDJsonResponse class] success:success failure:failure];
}

+ (void)signoutWithClient_id:(NSString *)client_id success:(void (^)(DDJsonResponse *resopnseObj))success failure:(void (^)(NSError *error))failure
{
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kSignoutUrl];
    
    NSDictionary *param = @{@"client_id":client_id};
    
    [self postWithUrl:url param:param resultClass:[DDJsonResponse class] success:success failure:failure];
}

+ (void)getClientIdWithNumber:(NSString *)number success:(void (^)(DDClientIdResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
    
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kGetClientId];
    
    NSDictionary *param = @{@"number":number};
    
    [self postWithUrl:url param:param resultClass:[DDClientIdResponse class] success:success failure:failure];
}

+ (void)getNumberWithClientId:(NSString *)client_id success:(void (^)(DDNumberResponse *resopnseObj))success failure:(void (^)(NSError *error))failure {
    
    NSString *url = [(NSString *)kAccountBaseUrl stringByAppendingString:(NSString *)kGetNumber];
    
    NSDictionary *param = @{@"client_id":client_id};
    
    [self postWithUrl:url param:param resultClass:[DDNumberResponse class] success:success failure:failure];
}




@end
