//
//  DDBaseAPIManager.m
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseAPIManager.h"
#import "CYHTTPTool.h"
#import "MJExtension.h"

@implementation DDBaseAPIManager

+ (void)postWithUrl:(NSString *)url param:(id)param success:(void (^)(id))success failure:(void (^)(NSError *))failure {
	
    [CYHTTPTool post:url params:param success:^(id responseObj) {
        if (success) {
            success(responseObj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    [CYHTTPTool post:url params:param success:^(id responseObj) {
        if (success) {
            //字典－>模型
            id result = [resultClass mj_objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param resultClassInArray:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure {
	
    [CYHTTPTool post:url params:param success:^(id responseObj) {
        if (success) {
            //字典数组－>模型数组
            NSArray *result = [resultClass mj_objectArrayWithKeyValuesArray:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}




@end
