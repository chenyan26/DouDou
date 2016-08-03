//
//  DDDialCell.h
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDCallRecord.h"
#import "DDCommonTableViewCell.h"

@class DDDialCell;

@protocol DDDialCellDelegate <NSObject>

- (void) dialCellDidRightButton:(DDDialCell *)dialCell;

@end

@interface DDDialCell : DDCommonTableViewCell

@property (nonatomic, strong) DDCallRecord *callRecord;

@property (nonatomic, weak) id<DDDialCellDelegate> delegate;

@end

