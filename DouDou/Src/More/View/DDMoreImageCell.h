//
//  DDMoreImageCell.h
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDCommonTableViewCell.h"

@interface DDMoreImageCell : DDCommonTableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *label;

- (void)setWithLeftImage:(UIImage *)image andText:(NSString *)text;

@end
