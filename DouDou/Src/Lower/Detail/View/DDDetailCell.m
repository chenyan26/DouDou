//
//  DDDetailCell.m
//  DouDou
//
//  Created by echo on 8/9/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDDetailCell.h"
#import "Masonry.h"

@interface DDDetailCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *centerLabel;

@end

@implementation DDDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.leftLabel];
        [self addSubview:self.centerLabel];
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
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_LEFT);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
        make.width.mas_equalTo(self.height);
    }];
    
    [_centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.equalTo(self);
    }];
}

- (void)setWithLeftText:(NSString *)title andText:(NSString *)text {
	
    [_leftLabel setText:title];
    [_centerLabel setText:text];
}



#pragma mark - getters and setters

- (UILabel *)leftLabel
{
    if (_leftLabel == nil) {
        _leftLabel = [[UILabel alloc] init];
    }
    return _leftLabel;
}

- (UILabel *)centerLabel
{
    if (_centerLabel == nil) {
        _centerLabel = [[UILabel alloc] init];
    }
    return _centerLabel;
}


@end
