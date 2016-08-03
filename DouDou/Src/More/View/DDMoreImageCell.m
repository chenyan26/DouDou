//
//  DDMoreImageCell.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDMoreImageCell.h"
#import <Masonry/Masonry.h>

@interface DDMoreImageCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation DDMoreImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.leftImageView];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews
{
    [_leftImageView setContentMode:UIViewContentModeScaleAspectFit];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(MARGIN_LEFT);
        make.height.mas_equalTo(self.height - 20);
        make.width.mas_equalTo(self.height - 10);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(_leftImageView.mas_right).with.offset(10);
        make.height.equalTo(self);
    }];
}

- (void)setWithLeftImage:(UIImage *)image andText:(NSString *)text {
    [_leftImageView setImage:image];
    [_label setText:text];
}



#pragma mark - getters and setters

- (UIImageView *)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

@end
