//
//  DDContactsDataHelper.h
//  DouDou
//
//  Created by ___chenyan___ on 8/10/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDContactsDataHelper : NSObject

/**
 *  格式化好友列表
 */
+ (NSMutableArray *) getContactsDataBy:(NSMutableArray *)array;
/**
 *  格式化好友分组
 */

+ (NSMutableArray *) getContactsSectionBy:(NSMutableArray *)array;

@end
