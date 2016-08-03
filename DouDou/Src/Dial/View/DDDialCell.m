//
//  DDDialCell.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDDialCell.h"
#import <Masonry/Masonry.h>

@interface DDDialCell ()

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation DDDialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.leftImageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.numberLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.rightButton];
        [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setTopLineStyle:CellLineStyleNone];
    [self setBottomLineStyle:CellLineStyleDefault];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(MARGIN_LEFT);
        make.width.mas_equalTo(WIDTH_LEFT_ICON);
        make.height.mas_equalTo(WIDTH_LEFT_ICON);
    }];
    [_leftImageView setContentMode:UIViewContentModeCenter];
    [_leftImageView setImage:[UIImage imageNamed:@"moreKB_video_call"]];
    
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).with.offset(- MARGIN_LEFT);
        make.width.mas_equalTo(WIDTH_LEFT_ICON);
        make.height.mas_equalTo(WIDTH_LEFT_ICON);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(_rightButton.mas_left).with.offset(- MARGIN_CELL);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImageView.mas_right).with.offset(MARGIN_CELL);
        make.top.mas_equalTo(MARGIN_LEFT);
        make.right.lessThanOrEqualTo(_timeLabel.mas_left);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.mas_equalTo(- MARGIN_LEFT);
        make.right.lessThanOrEqualTo(_timeLabel.mas_left);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - event response

- (void)rightButtonClick:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(dialCellDidRightButton:)]) {
        [_delegate dialCellDidRightButton:self];
    }
}

#pragma mark - getters and setters

- (void)setCallRecord:(DDCallRecord *)callRecord
{
    [_nameLabel setText:callRecord.name];
    [_numberLabel setText:callRecord.number];
    [_timeLabel setText:callRecord.time];
}

-(UIImageView *)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)numberLabel
{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
    }
    return _numberLabel;
}

- (UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        [_rightButton setContentMode:UIViewContentModeCenter];
        [_rightButton setImage:[UIImage imageNamed:@"right_icon"] forState:UIControlStateNormal];
    }
    return _rightButton;
}

@end
