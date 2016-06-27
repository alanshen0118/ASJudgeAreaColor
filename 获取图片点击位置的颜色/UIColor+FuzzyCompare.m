//
//  UIColor+FuzzyCompare.m
//  获取图片点击位置的颜色
//
//  Created by alan on 6/27/16.
//  Copyright © 2016 bjdv. All rights reserved.
//

#import "UIColor+FuzzyCompare.h"

@implementation UIColor (FuzzyCompare)

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self fuzzyCompareWithRed:red green:green blue:blue offset:.1f];
}

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self fuzzyCompareWithRed:red green:green blue:blue alpha:alpha offset:.1f];
}

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue offset:(CGFloat)offset {
    return [self fuzzyCompareWithRed:red green:green blue:blue alpha:1 offset:.1f];
}

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha offset:(CGFloat)offset {
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        CGFloat redValue, greenValue, blueValue, alphaValue;
        if ([self getRed:&redValue green:&greenValue blue:&blueValue alpha:&alphaValue]) {
            if (redValue > red - offset && redValue < red + offset && greenValue > green - offset && greenValue < green + offset && blueValue > blue - offset && blue + offset && alphaValue > alpha - offset && alphaValue < alpha + offset) {
                return YES;
            }
        }
    }
    return false;
}

@end
