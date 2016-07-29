//
//  DDLoginCellView.h
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDLoginCellView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextField *textField;

- (void)setWithImageName:(NSString *)name andText:(NSString *)text;

@end
