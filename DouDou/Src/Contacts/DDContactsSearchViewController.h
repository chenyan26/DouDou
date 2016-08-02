//
//  DDContactsSearchViewController.h
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDContactsSearchViewController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *contactsArray;

@end
