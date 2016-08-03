//
//  DDContactsHeadView.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDContactsHeadView.h"
#import <Masonry/Masonry.h>

@interface DDContactsHeadView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DDContactsHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [[UIView alloc] init];
        [bgView setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setBackgroundView:bgView];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_CELL);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
    }];
}

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        [_label setTextColor:[UIColor grayColor]];
        [_label setFont:[UIFont systemFontOfSize:14.5f]];
    }
    return _label;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [_label setText:title];
}

@end
