//
//  DDEditViewController.h
//  DouDou
//
//  Created by echo on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDContact.h"

@class DDEditViewController;

@protocol EditViewControllerDelegate <NSObject>

@optional

- (void)editViewControllerSavaBtn:(DDEditViewController *)editVC contact:(DDContact *)contact;

@end


@interface DDEditViewController : UIViewController

- (instancetype)initWithContact:(DDContact *)contact;

@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;

@end
