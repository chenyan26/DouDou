//
//  DDLabelCellView.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDLabelCellView.h"
#import <Masonry/Masonry.h>

@interface DDLabelCellView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DDLabelCellView

- (instancetype)init
{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.label];
        [self addSubview:self.textField];
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
    
    [_textField setClearButtonMode:UITextFieldViewModeAlways];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right);
        make.top.mas_equalTo(0);
        make.right.equalTo(self.mas_right).with.offset(-MARGIN_LEFT);
        make.height.equalTo(self);
    }];
}

- (void)setWithLabelName:(NSString *)name andPlaceholder:(NSString *)text {
    [_label setText:name];
    [_textField setPlaceholder:text];
}

#pragma mark - getters and setters

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
    }
    return _textField;
}

@end
