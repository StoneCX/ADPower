//
//  UIImage+MCImage.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "UIImage+MCImage.h"

@implementation UIImage (MCImage)

+ (instancetype)imageWithOriginalRender:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *renderImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return renderImage;
}

@end
