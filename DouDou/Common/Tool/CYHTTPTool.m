//
//  CYHTTPTool.m
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "CYHTTPTool.h"
#import "AFNetworking.h"

@implementation CYHTTPTool

+ (void)get:(NSString *)url params:(id)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:params progress:nil
     
         success:^(NSURLSessionDataTask * task, id responseObject) {
             if (success) {
                 success(responseObject);
             }
             
         } failure:^(NSURLSessionDataTask * task, NSError * error) {
             if (failure) {
                 failure(error);
             }
         }];
}

+ (void)post:(NSString *)url params:(id)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager POST:url parameters:params progress:nil
     
          success:^(NSURLSessionDataTask * task, id responseObject) {
              if (success) {
                  success(responseObject);
              }
          } failure:^(NSURLSessionDataTask * task, NSError * error) {
              if (failure) {
                  failure(error);
              }
          }];
}



@end
