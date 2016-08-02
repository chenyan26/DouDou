//
//  DDCommonTableViewCell.h
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellLineStyle) {
    CellLineStyleDefault,
    CellLineStyleFill,
    CellLineStyleNone,
};

@interface DDCommonTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, assign) float leftFreeSpace;

@property (nonatomic, assign) CellLineStyle bottomLineStyle;
@property (nonatomic, assign) CellLineStyle topLineStyle;

@end
