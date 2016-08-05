//
//  DDAccountTool.h
//  DouDou
//
//  Created by ___chenyan___ on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDAccount.h"

@interface DDAccountTool : NSObject

/**
 *  存储帐号
 */
+ (void)save:(DDAccount *)account;

/**
*  读取存帐号
*/
+ (DDAccount *)account;

/**
 *  删除帐号
 */
+ (BOOL)removeAccount;

@end
