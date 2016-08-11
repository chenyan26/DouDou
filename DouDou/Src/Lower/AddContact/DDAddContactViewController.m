//
//  DDAddContactViewController.m
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "DDAddContactViewController.h"

#import "DDLabelCellView.h"
#import "DDImageCellView.h"

#import "DDContact.h"

#import <Masonry/Masonry.h>
#import "DDBaseDBHandle+Contact.h"

#import "MBProgressHUD+CY.h"

@interface DDAddContactViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) DDImageCellView *avatarView;
@property (nonatomic, weak) DDLabelCellView *nameView;
@property (nonatomic, weak) DDLabelCellView *numberView;

@property (nonatomic, strong) UIBarButtonItem *saveButton;

@property (nonatomic, strong) DDContact *contact;

@end

@implementation DDAddContactViewController

#pragma mark - life cycle

- (instancetype)init
{
    if (self =[super init]){
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"添加联系人"];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self.navigationItem setRightBarButtonItem:self.saveButton];
    
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSubviews
{
    DDImageCellView *avatarV = [[DDImageCellView alloc] init];
    _avatarView = avatarV;
    DDLabelCellView *nameV = [[DDLabelCellView alloc] init];
    _nameView = nameV;
    DDLabelCellView *numberV = [[DDLabelCellView alloc] init];
    _numberView = numberV;
    
    [self.view addSubview:_avatarView];
    [self.view addSubview:_nameView];
    [self.view addSubview:_numberView];
    
    //头像
    [_avatarView setBackgroundColor:[UIColor whiteColor]];
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(MARGIN_CELL + 64);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(HEIGHT_IMAGE_CELL);
    }];
    
    //姓名
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_avatarView.mas_bottom).with.offset(MARGIN_CELL);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
    }];
   
    [_nameView setWithLabelName:@"姓名" andPlaceholder:@"请输入姓名"];
    _nameView.textField.delegate = self;
    _nameView.textField.tag = 1;
    
    //号码
    [_numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_nameView.mas_bottom).with.offset(MARGIN_CELL);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(HEIGHT_LOGINCELL);
    }];
    [_numberView.textField setKeyboardType:UIKeyboardTypePhonePad];
    _numberView.textField.delegate = self;
    _numberView.textField.tag = 2;
    
    [_numberView setWithLabelName:@"号码" andPlaceholder:@"请输入9或者8加手机号码"];
    
    //备注
    UILabel *noteLable = [[UILabel alloc] init];
    [noteLable setText:@"备注：拨打电视使用8加手机号码，拨打手机使用9加手机号码"];
    [noteLable setTextColor:DEFAULT_TEXT_GRAY_COLOR];
    [noteLable setNumberOfLines:2];
    
    [self.view addSubview:noteLable];
    [noteLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_LEFT);
        make.top.equalTo(_numberView.mas_bottom).with.offset(MARGIN_LEFT);
        make.right.equalTo(self.view.mas_right).with.offset(-MARGIN_LEFT);
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(done:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];
    return YES;
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    int offset = textField.superview.y + textField.superview.height + 5 - (self.view.height - 216.0);
    if (offset > 0){
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        self.view.frame = CGRectMake(0, -offset, self.view.width, self.view.height);
        
        [UIView commitAnimations];
    }
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.width, self.view.height);
}

#pragma mark - Event Response

-(void)done:(id)sender
{
    [_nameView.textField resignFirstResponder];
    [_numberView.textField resignFirstResponder];
}

- (void)saveButtonClick
{
//    判断 姓名、号码 是否为空
    if (_nameView.textField.text.length == 0 || _numberView.textField.text.length == 0) {
        //为空
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"姓名、号码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        //附加判断逻辑？
        
        self.contact.number = _numberView.textField.text;
        self.contact.nickname = _nameView.textField.text;
        
        DDBaseDBHandle *handle = [DDBaseDBHandle shareDataBaseHandle];
        if ([handle insertContact:_contact]) {
            [MBProgressHUD showShortMessage:@"保存成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - getters and setters

-(UIBarButtonItem *)saveButton
{
    if (_saveButton == nil) {
        _saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonClick)];
        [_saveButton setTintColor:[UIColor whiteColor]];
    }
    return _saveButton;
}

- (DDContact *)contact
{
    if (_contact == nil) {
        _contact = [[DDContact alloc] init];
    }
    return _contact;
}

@end




