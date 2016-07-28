//
//  UIImage+CY.m
//  DouDou
//
//  Created by echo on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "UIImage+CY.h"

@implementation UIImage (CY)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    //开始
    UIGraphicsBeginImageContext(rect.size);
    //获取画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //清空
    UIGraphicsEndImageContext();
    
    return image;
}

@end
