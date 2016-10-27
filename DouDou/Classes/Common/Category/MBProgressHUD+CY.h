//
//  MBProgressHUD+CY.h
//  DouDou
//
//  Created by chenyan on 8/5/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "MBProgressHUD/MBProgressHUD.h"

@interface MBProgressHUD (CY)

+ (void)showShortMessage:(NSString *)message toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showShortMessage:(NSString *)message;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;

+ (void)hideHUD;

+ (void)hideDim:(Boolean)hideDim hud:(MBProgressHUD *)hud;

@end
