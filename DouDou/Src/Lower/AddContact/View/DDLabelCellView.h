//
//  DDLabelCellView.h
//  DouDou
//
//  Created by echo on 8/2/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDLabelCellView : UIView

@property (nonatomic, strong) UITextField *textField;

- (void)setWithLabelName:(NSString *)name andPlaceholder:(NSString *)text;

@end
