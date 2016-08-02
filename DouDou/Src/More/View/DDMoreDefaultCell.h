//
//  DDMoreDefaultCell.h
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDCommonTableViewCell.h"

@interface DDMoreDefaultCell : DDCommonTableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *rightImageView;


- (void)setWithLeftImageName:(NSString *)leftName andText:(NSString *)text;

@end
