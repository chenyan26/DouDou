//
//  UIImage+CY.m
//  DouDou
//
//  Created by chenyan on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import "UIImage+CY.h"

@implementation UIImage (CY)

+ (UIImage *)cy_imageWithColor:(UIColor *)color {
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

+ (UIImage *)cy_resizeImageWithName:(NSString *)imageName edgeInsets:(UIEdgeInsets)edgeInset {
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeStretch];
    return image;
}

+ (UIImage *)cy_resizeImageWithName:(NSString *)imageName {
    return [self cy_resizeImageWithName:imageName edgeInsets:UIEdgeInsetsZero];
}

+ (UIImage *)cy_circleImageWithOldImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
	
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画边框（大圆）
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    
    //小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(context);
    
    //画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    //取图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}






@end
