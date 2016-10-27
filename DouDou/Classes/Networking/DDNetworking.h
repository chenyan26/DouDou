//
//  DDNetworking.h
//  DouDou
//
//  Created by chenyan on 2016/10/20.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDNetworking : NSObject

+ (NSURLSessionTask *)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (NSURLSessionTask *)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)cancel;

@end
