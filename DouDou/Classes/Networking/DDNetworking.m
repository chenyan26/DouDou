//
//  DDNetworking.m
//  DouDou
//
//  Created by chenyan on 2016/10/20.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import "DDNetworking.h"
#import "AFNetworking.h"

@implementation DDNetworking

+ (NSURLSessionDataTask *)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLSessionDataTask *task = [manager GET:url parameters:params progress:nil
     
         success:^(NSURLSessionDataTask * task, id responseObject) {
             if (success) {
                 success(responseObject);
             }
             
         } failure:^(NSURLSessionDataTask * task, NSError * error) {
             if (failure) {
                 failure(error);
             }
         }];
    return task;
}

+ (NSURLSessionDataTask *)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSURLSessionDataTask *task = [manager POST:url parameters:params progress:nil
     
          success:^(NSURLSessionDataTask * task, id responseObject) {
              if (success) {
                  success(responseObject);
              }
          } failure:^(NSURLSessionDataTask * task, NSError * error) {
              if (failure) {
                  failure(error);
              }
          }];
    return task;
}

+ (void)cancel {
	//取消网络请求
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
    
    // 取消任务中的所有网络请求
//    [[AFHTTPSessionManager manager].tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 杀死Session
//    [[AFHTTPSessionManager manager] invalidateSessionCancelingTasks:YES];
}



@end
