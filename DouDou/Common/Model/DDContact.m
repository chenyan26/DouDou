//
//  DDContact.m
//  DouDou
//
//  Created by ___chenyan___ on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContact.h"

@implementation DDContact

- (void)setNickname:(NSString *)nickname
{
    _nickname = nickname;
    _pinyin = nickname.pinyin;
    _initial = nickname.pinyinInitial;
}

@end
