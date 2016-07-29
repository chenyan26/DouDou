//
//  DDLoginCellView.m
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDLoginCellView.h"
#import <Masonry/Masonry.h>

@implementation DDLoginCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _textField = [[UITextField alloc] init];
    }
    return self;
}

- (void)setWithImageName:(NSString *)name andText:(NSString *)text
{
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
    [_imageView setImage:[UIImage imageNamed:name]];
    [_imageView setContentMode:UIViewContentModeCenter];
    
    [self addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
        make.width.equalTo(self.mas_height);
    }];
    
    [self addSubview:_textField];
    
    [_textField setPlaceholder:text];
    [_textField setClearButtonMode:UITextFieldViewModeAlways];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(_imageView.mas_right).with.offset(10.0f);
        make.right.equalTo(self.mas_right).with.offset(-20.0f);
        make.height.equalTo(self);
    }];
}

@end
