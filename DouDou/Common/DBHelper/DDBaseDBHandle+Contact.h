//
//  DDBaseDBHandle+Contact.h
//  DouDou
//
//  Created by echo on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDBaseDBHandle.h"

@class DDContact;

@interface DDBaseDBHandle (Contact)

- (BOOL)creatContactTable;

- (BOOL)insertContact:(DDContact *)contact;

- (BOOL)deleteContactById:(NSString *)Id;

- (BOOL)updateContact:(DDContact *)contact ById:(NSString *)Id;

- (NSMutableArray *)selectAllContactFromContactTable;

- (void)replaceAllContacts:(NSArray <DDContact *>*)contacts;

@end
