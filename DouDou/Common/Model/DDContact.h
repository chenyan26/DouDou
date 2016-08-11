//
//  DDContact.h
//  DouDou
//
//  Created by ___chenyan___ on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDContact : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *number;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *initial;

@end
 