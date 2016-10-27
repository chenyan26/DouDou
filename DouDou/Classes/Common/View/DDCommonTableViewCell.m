//
//  DDCommonTableViewCell.m
//  DouDou
//
//  Created by chenyan on 7/29/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDCommonTableViewCell.h"

@implementation DDCommonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _leftFreeSpace = 20.0 ;
        _topLineStyle = CellLineStyleNone;
        _bottomLineStyle = CellLineStyleDefault;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.topLine setY:0];
    [self.bottomLine setY:self.height - _bottomLine.height];
    [self setTopLineStyle:_topLineStyle];
    [self setBottomLineStyle:_bottomLineStyle];
}

-(void)setTopLineStyle:(CellLineStyle)style
{
    _topLineStyle = style;
    switch (style) {
        case CellLineStyleDefault: {
            [self.topLine setX:_leftFreeSpace];
            [self.topLine setWidth:self.width - _leftFreeSpace];
            [self.topLine setHidden:NO];
            break;
        }
        case CellLineStyleFill: {
            [self.topLine setX:0];
            [self.topLine setWidth:self.width];
            [self.topLine setHidden:NO];
            break;
        }
        case CellLineStyleNone: {
            [self.topLine setHidden:YES];
            break;
        }
    }
}

-(void)setBottomLineStyle:(CellLineStyle)style
{
    _bottomLineStyle = style;
    switch (style) {
        case CellLineStyleDefault: {
            [self.bottomLine setX:_leftFreeSpace];
            [self.bottomLine setWidth:self.width - _leftFreeSpace];
            [self.bottomLine setHidden:NO];
            break;
        }
        case CellLineStyleFill: {
            [self.bottomLine setX:0];
            [self.bottomLine setWidth:self.width];
            [self.bottomLine setHidden:NO];
            break;
        }
        case CellLineStyleNone: {
            [self.bottomLine setHidden:YES];
            break;
        }
    }
}

-(UIView *)topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setHeight:0.5f];
        [_topLine setBackgroundColor:[UIColor grayColor]];
        [_topLine setAlpha:0.4];
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

-(UIView *)bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        [_bottomLine setHeight:0.5f];
        [_bottomLine setBackgroundColor:[UIColor grayColor]];
        [_bottomLine setAlpha:0.4];
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

@end