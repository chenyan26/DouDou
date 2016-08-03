//
//  DDImageCellView.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDImageCellView.h"
#import <Masonry/Masonry.h>

@interface DDImageCellView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DDImageCellView

- (instancetype)init
{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.label];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_LEFT);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(HEIGHT_LOGINCELL);
        make.height.equalTo(self);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.equalTo(self.mas_right).with.offset(-40);
        make.height.mas_equalTo(self.height - 20);
        make.width.mas_equalTo(self.height - 20);
    }];
}

#pragma mark - getters and setters

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        [_label setText:@"头像"];
    }
    return _label;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"tx01"]];
    }
    return _imageView;
}

@end
