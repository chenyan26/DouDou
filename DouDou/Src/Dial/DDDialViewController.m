//
//  DDDialViewController.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDDialViewController.h"
#import <Masonry/Masonry.h>

#import "DDDialCell.h"
#import "DDCallRecord.h"

#import "DDCallViewController.h"
#import "DDDetailViewController.h"

#import "DDDialBoardView.h"

@interface DDDialViewController ()<UITableViewDelegate, UITableViewDataSource, DDDialCellDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIView *toolView;

@property (nonatomic, weak) DDDialBoardView *dialBoardView;
/**
 *  出、收键盘
 */
@property (nonatomic, weak) UIButton *dialBoardButton;
@property (nonatomic, weak) UIButton *callButton;

@end


static const NSString *kDialCell = @"kDialCell";
static const CGFloat kRowHeight = 60.0f;

@implementation DDDialViewController
{
    DDCallViewController *callVC;
    DDDetailViewController *detailVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // tabbar = 49, toolView = 49  ==> 98
    UITableView *t = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, self.view.height - 98)];
    _tableView = t;
    [self.view addSubview:_tableView];
    
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] init]];
    [_tableView registerClass:[DDDialCell class] forCellReuseIdentifier:(NSString *)kDialCell];
    
    //下方的 toolView
    UIView *v = [[UIView alloc] init];
    _toolView = v;
    [self.view addSubview:_toolView];
    
    [_toolView setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
//    [_toolView setBackgroundColor:[UIColor clearColor]];
    [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(49);
    }];
    
    //tool上的呼叫 按钮
    UIButton *btn = [[UIButton alloc] init];
    _callButton = btn;
    [_toolView addSubview:_callButton];
    
    [_callButton setTitle:@"call" forState:UIControlStateNormal];
    [_callButton setBackgroundColor:[UIColor redColor]];
    [_callButton addTarget:self action:@selector(callButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_toolView);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(80);
    }];
    
    //dialBoardButton 呼出、关闭boardView
    UIButton *dbtn = [[UIButton alloc] init];
    _dialBoardButton = dbtn;
    [_toolView addSubview:_dialBoardButton];
    [_dialBoardButton addTarget:self action:@selector(dialBoardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_dialBoardButton setTintColor:DEFAULT_NAVBAR_COLOR];
    [_dialBoardButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard"] forState:UIControlStateNormal];
    [_dialBoardButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard_HL"] forState:UIControlStateSelected];
    
    [_dialBoardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.centerY.equalTo(_toolView);
        make.height.equalTo(_toolView);
        make.width.equalTo(_toolView.mas_height);
    }];
    
    //dialBoardView
    DDDialBoardView *dv = [[DDDialBoardView alloc] init];
    _dialBoardView = dv;
    [self.view insertSubview:_dialBoardView belowSubview:_toolView];
    
    [_dialBoardView setFrame:CGRectMake(0, HEIGHT_SCREEN, WIDTH_SCREEN, kRowHeight * 5)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DDDialCellDelegate

- (void) dialCellDidRightButton:(DDDialCell *)dialCell {
    detailVC = [[DDDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDDialCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)kDialCell forIndexPath:indexPath];
    cell.delegate = self;
    DDCallRecord *callR = [[DDCallRecord alloc] init];
    callR.name = @"kiyola";
    callR.number = @"235325436";
    callR.time = @"05:04";
    [cell setCallRecord:callR];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HEIGHT_IMAGE_CELL;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /**
     呼叫－－－需要带上 dialrecord 数据
     
     */
    callVC = [[DDCallViewController alloc] init];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController pushViewController:callVC animated:NO];
}


#pragma mark - event response

- (void)dialBoardButtonClick:(UIButton *)sender
{
    if (sender.isSelected) {
        [sender setSelected:NO];
        [UIView animateWithDuration:0.5 animations:^{
            _dialBoardView.y = HEIGHT_SCREEN;
        }];
    } else {
        [sender setSelected:YES];
        int offset = _toolView.y - _dialBoardView.height;
        
        [UIView animateWithDuration:0.5 animations:^{
            _dialBoardView.y = offset;
        }];
        
//        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(done:)];
//        tapGestureRecognizer.numberOfTapsRequired = 1;
//        [self.view addGestureRecognizer: tapGestureRecognizer];
//        tapGestureRecognizer.numberOfTouchesRequired = 1;
    }
}

/**
 *  手势－收 boardView
 *
 *  @param sender <#sender description#>
 */
//-(void)done:(id)sender
//{
//    [_dialBoardButton setSelected:NO];
//    [UIView animateWithDuration:0.5 animations:^{
//        _dialBoardView.y = HEIGHT_SCREEN;
//    }];
//    [self.view removeGestureRecognizer:sender];
//}

- (void)callButtonClick:(id)sender
{
    /**
     *  通过 text ＝ number 呼叫
     */
    NSLog(@"打电话啊:%@", _dialBoardView.text);
    
}

#pragma mark - private methods

#pragma mark - getters and setters
@end
