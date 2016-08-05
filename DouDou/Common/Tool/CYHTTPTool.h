//
//  CYHTTPTool.h
//  DouDou
//
//  Created by ___chenyan___ on 8/4/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYHTTPTool : NSObject

+ (void)get:(NSString *)url params:(id)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(id)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

@end
