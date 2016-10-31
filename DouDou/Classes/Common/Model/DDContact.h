//
//  DDContact.h
//  DouDou
//
//  Created by echo on 2016/10/31.
//  Copyright © 2016年 caratel. All rights reserved.
//

#import <Realm/Realm.h>

@interface DDContact : RLMObject

/*!
 用户ID
 */
@property(nonatomic, strong) NSString *userId;

/*!
 用户名称
 */
@property(nonatomic, strong) NSString *name;

/*!
 用户头像的URL
 */
@property(nonatomic, strong) NSString *portraitUri;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<DDContact>
//RLM_ARRAY_TYPE(DDContact)
