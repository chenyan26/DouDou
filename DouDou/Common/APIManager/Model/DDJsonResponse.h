//
//  DDJsonResponse.h
//  DouDou
//
//  Created by ___chenyan___ on 8/5/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrCodeType) {
    OK = 0,
    INVALID_VCODE = 40001,
    UNABLE_CREATE_ACCOUNT = 40002,
    UNABLE_RESET_PASSWORD = 40003,
    ERR_ACCOUNT_INFO = 40004,
    ERR_BIND_DEVICE = 40005,
    ERR_NOT_LOGIN = 40006,
    ERR_SAVE_CONTACTS = 40007,
    ERR_GET_CONTACTS = 40008
};

@interface DDJsonResponse : NSObject

@property (nonatomic, assign) ErrCodeType errcode;

@end
