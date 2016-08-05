//
//  MBProgressHUD+CY.m
//  DouDou
//
//  Created by echo on 8/5/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "MBProgressHUD+CY.h"

@implementation MBProgressHUD (CY)

+ (void)showShortMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [hud setContentColor:[UIColor blackColor]];
    [hud.label setFont:[UIFont systemFontOfSize:14.0f]];
    [hud.label setText:message];
    
    [hud setMode:MBProgressHUDModeText];
    
    [self hideDim:YES hud:hud];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    // 0.7秒之后再消失
    [hud hideAnimated:YES afterDelay:0.7];
}

+ (void)hideDim:(Boolean)hideDim hud:(MBProgressHUD *)hud {
    if (hideDim) {
        [hud setBackgroundColor:[UIColor clearColor]];
    } else {
        [hud setBackgroundColor:DEFAULT_DIM_COLOR];
    }
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [hud.label setFont:[UIFont systemFontOfSize:14.0f]];
    [hud.label setText:message];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    [hud setMode:MBProgressHUDModeAnnularDeterminate];
    
    [self hideDim:NO hud:hud];
    
    return hud;
}

+ (void)showShortMessage:(NSString *)message
{
    [self showShortMessage:message toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message

{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}


@end
