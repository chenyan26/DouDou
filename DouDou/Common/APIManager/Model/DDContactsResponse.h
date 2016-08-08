//
//  DDContactsResponse.h
//  DouDou
//
//  Created by ___chenyan___ on 8/8/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDJsonResponse.h"
#import "DDAccount.h"

@interface DDContactsResponse : DDJsonResponse

@property (nonatomic, strong) NSArray<DDAccount *> *contacts;

@end
