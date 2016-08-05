//
//  DDControllerTool.h
//  DouDou
//
//  Created by ___chenyan___ on 8/5/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RootControllerType) {
    RootControllerTypeLogin,
    RootControllerTypeRoot
};

@interface DDControllerTool : NSObject

+ (void) chooseRootViewController:(RootControllerType) controllerType;

@end
