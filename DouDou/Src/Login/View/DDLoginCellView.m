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
    if (self = [super init]) {
        [self addSubview:self.textField];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    [_imageView setContentMode:UIViewContentModeCenter];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(self);
        make.width.equalTo(self.mas_height);
    }];
    
    [_textField setReturnKeyType:UIReturnKeyDone];
    [_textField setClearButtonMode:UITextFieldViewModeAlways];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(_imageView.mas_right).with.offset(10.0f);
        make.right.equalTo(self.mas_right).with.offset(-20.0f);
        make.height.equalTo(self);
    }];

}

- (void)setWithImageName:(NSString *)name andText:(NSString *)text
{
    [_imageView setImage:[UIImage imageNamed:name]];
    [_textField setPlaceholder:text];
}

#pragma mark - getters and setters

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
    }
    return _textField;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
