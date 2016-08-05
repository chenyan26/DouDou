//
//  DDBaseAPIManager.h
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDBaseAPIManager : NSObject

/**
 *  获取 字典 数据
 */
+ (void)postWithUrl:(NSString *)url param:(id)param success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  获取 模型 数据
 */
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**
 *  获取 模型数组 
 */
+ (void)postWithUrl:(NSString *)url param:(id)param resultClassInArray:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

@end
