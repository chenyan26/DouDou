//
//  DDMoreDefaultCell.m
//  DouDou
//
//  Created by echo on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDMoreDefaultCell.h"
#import <Masonry/Masonry.h>

@interface DDMoreDefaultCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation DDMoreDefaultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.leftImageView];
        [self addSubview:self.label];
        [self addSubview:self.rightImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_leftImageView setContentMode:UIViewContentModeCenter];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
        make.width.mas_equalTo(self.height);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftImageView.mas_right).with.offset(10);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
    }];
    
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
        make.width.mas_equalTo(self.height);
    }];
}

- (void)setWithLeftImageName:(NSString *)leftName andText:(NSString *)text {
    [_leftImageView setImage:[UIImage imageNamed:leftName]];
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

- (UIImageView *)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
        [_rightImageView setContentMode:UIViewContentModeCenter];
        [_rightImageView setImage:[UIImage imageNamed:@"right_icon"]];
    }
    return _rightImageView;
}

@end
