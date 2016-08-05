//
//  DDAccount.h
//  DouDou
//
//  Created by ___chenyan___ on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDAccount : NSObject<NSCoding>

@property (nonatomic, copy) NSString *number;

@property (nonatomic, copy) NSString *password;

/**
 *  设备ID＝UUID
 */
@property (nonatomic, copy) NSString *client_id;

//@property (nonatomic, copy) NSString *sipId;

@end
