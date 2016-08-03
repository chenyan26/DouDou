//
//  DDContactsCell.m
//  DouDou
//
//  Created by echo on 8/1/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContactsCell.h"
#import <Masonry/Masonry.h>

@interface DDContactsCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation DDContactsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.leftImageView];
        [self addSubview:self.label];
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
    
//    self.leftFreeSpace = 10;
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

@end
