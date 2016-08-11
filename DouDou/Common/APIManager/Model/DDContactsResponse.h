//
//  DDContactsResponse.h
//  DouDou
//
//  Created by ___chenyan___ on 8/8/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDJsonResponse.h"
#import "DDContact.h"

@interface DDContactsResponse : DDJsonResponse

@property (nonatomic, strong) NSArray<DDContact *> *contacts;

@end
