//
//  UIImage+CY.h
//  DouDou
//
//  Created by chenyan on 7/28/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CY)

/**
 *  绘制纯色图片
 */
+ (UIImage *)cy_imageWithColor:(UIColor *)color;
/**
 *  返回拉伸后的图片,默认为从中点拉伸
 */
+ (UIImage *)cy_resizeImageWithName:(NSString *)imageName;

/**
 *  返回拉伸后的图片,指定拉伸位置
 */
+ (UIImage *)cy_resizeImageWithName:(NSString *)imageName edgeInsets:(UIEdgeInsets)edgeInset;

/**
 *  将方图片转换成圆图片
 */
+ (UIImage *)cy_circleImageWithOldImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  为中心图片画出背景图
 */
//+ (UIImage *)cy_generateCenterImageWithBgColor:(UIColor *)bgImageColor bgImageSize:(CGSize)bgImageSize centerImage:(UIImage *)centerImage;

/**
 *  压缩图片
 */
//- (UIImage *)cy_scaleToSize:(CGSize)size;
/**
 *  等比例压缩图片
 */
//- (UIImage *)cy_imageCompressForSize:(CGSize)size;

/**
 *  返回指定尺寸的图片
 */
//- (UIImage *)cy_imageWithScaleSize:(CGSize)scaleSize;

@end
