//
//  UIImage+RoundImage.h
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/23.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundImage)

+ (UIImage *)drawOvalPictureWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColour:(UIColor *)borderColour;

@end
