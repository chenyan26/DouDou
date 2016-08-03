//
//  DDDialBoardView.m
//  DouDou
//
//  Created by echo on 8/3/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDDialBoardView.h"
#import <Masonry/Masonry.h>

@interface DDDialBoardView ()<UITextFieldDelegate>

//上部view
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITextField *textFiled;
@property (nonatomic, strong) UIButton *rightButton;

//号盘view
@property (nonatomic, strong) UIView *boardView;

//上边线
@property (nonatomic, strong) UIView *topLine;
//下边线
@property (nonatomic, strong) UIView *bottomLine;

//button的数组
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

static const CGFloat kLineWidth = 0.3f;
static const CGFloat kLineAlpha = 0.3f;
static const CGFloat kRowHeight = 60.0f;

@implementation DDDialBoardView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        
        [self addSubview:self.topView];
        [self addSubview:self.boardView];
        
        [_topView addSubview:self.textFiled];
        [_topView addSubview:self.rightButton];
        [_rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.topLine];
        [self addSubview:self.bottomLine];
    }
    return self;
}

- (void)layoutSubviews
{
    [_topLine setFrame:CGRectMake(0, 0, self.width, kLineWidth)];
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.equalTo(self);
        make.height.mas_equalTo(kLineWidth);
        make.bottom.equalTo(self);
    }];
    
    //上部view
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kLineWidth);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(kRowHeight - kLineWidth);
        make.width.mas_equalTo(self);
    }];
    
    //删除 按钮
    [_rightButton setContentMode:UIViewContentModeCenter];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.equalTo(self.mas_right).with.offset(- MARGIN_LEFT);
        make.height.equalTo(_topView);
        make.width.equalTo(_topView.mas_height);
    }];
    
    //输入框
    [_textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(MARGIN_LEFT);
        make.height.equalTo(_topView);
        make.right.equalTo(_rightButton.mas_left).with.offset(- MARGIN_LEFT);
    }];
    
    //键盘
    [_boardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_topView.mas_bottom).with.offset(1);
        make.width.equalTo(self);
//        make.height.mas_equalTo(self.height - kLineWidth * 2 - _topView.height - 1);
        make.bottom.equalTo(_bottomLine.mas_top);
    }];
    
    for (UIButton *button in self.btnArray) {
        [_boardView addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat width = (self.width - ( 1 * 2 )) / 3;
        CGFloat height = (self.height - kLineWidth * 2 - _topView.height - 1 - ( 1 * 3 )) / 4;
        
        CGFloat x = (button.tag % 3) * (width + 1);
        CGFloat y = (button.tag / 3) * (height + 1);
        
        [button setFrame:CGRectMake(x, y, width, height)];
    }
}

#pragma mark - UITextFieldDelegate



#pragma mark - notifacation event

#pragma mark - event response

- (void)rightButtonClick
{
    if (_text.length > 0) {
        [_text deleteCharactersInRange:NSMakeRange(_text.length - 1, 1)];
        [_textFiled setText:_text];
    }
}

- (void)buttonClick:(UIButton *)sender
{
    _text = [NSMutableString stringWithString:_textFiled.text];
    [_text appendString:sender.currentTitle];
    [_textFiled setText:_text];
}

#pragma mark - private methods

#pragma mark - getters and setters

- (UIView *)topView
{
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        [_topView setBackgroundColor:[UIColor whiteColor]];
    }
    return _topView;
}

- (NSMutableArray *)btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
        
        for (int i = 0; i < 12; i ++) {
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
            
            NSString *str;
            switch (i) {
                case 9:
                    str = @"*";
                    break;
                case 10:
                    str = @"0";
                    break;
                case 11:
                    str = @"#";
                    break;
                default:
                    str = [NSString stringWithFormat:@"%d",i + 1];
                    break;
            }
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor]  forState:UIControlStateHighlighted];
            
            [btn setTitle:str forState:UIControlStateNormal];
            [btn setTitle:str forState:UIControlStateHighlighted];
            
            [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageWithColor:DEFAULT_NAVBAR_COLOR] forState:UIControlStateHighlighted];
            
            [_btnArray addObject:btn];
        }
    }
    return _btnArray;
}

- (UIView *)boardView
{
    if (_boardView == nil) {
        _boardView = [[UIView alloc] init];
    }
    return _boardView;
}

- (UITextField *)textFiled
{
    if (_textFiled == nil) {
        _textFiled = [[UITextField alloc] init];
        [_textFiled setPlaceholder:@"请输入8或者9加手机号码"];
        [_textFiled setEnabled:NO];
    }
    return _textFiled;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        [_rightButton setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
    }
    return _rightButton;
}

- (UIView *)topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setBackgroundColor:[UIColor blackColor]];
        [_topLine setAlpha:kLineAlpha];
    }
    return _topLine;
}

- (UIView *)bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        [_bottomLine setBackgroundColor:[UIColor blackColor]];
        [_bottomLine setAlpha:kLineAlpha];
    }
    return _bottomLine;
}

@end
