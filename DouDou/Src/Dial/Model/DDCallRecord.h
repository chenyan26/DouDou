//
//  DDCallRecord.h
//  DouDou
//
//  Created by ___chenyan___ on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  以区分 左边的 图标
 */
typedef NS_ENUM(NSInteger, CallRecordType) {
    /**
     *  绿标
     */
    CallRecordTypeSuccess,
    /**
     *  红标
     */
    CallRecordTypeFail,
    /**
     *
     */
    CallRecordTypeMiss
};

@interface DDCallRecord : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *number;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, assign) CallRecordType callRecordType;

@end
