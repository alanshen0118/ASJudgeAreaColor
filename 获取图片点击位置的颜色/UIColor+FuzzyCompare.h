//
//  UIColor+FuzzyCompare.h
//  获取图片点击位置的颜色
//
//  Created by alan on 6/27/16.
//  Copyright © 2016 bjdv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FuzzyCompare)

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue offset:(CGFloat)offset;

- (BOOL)fuzzyCompareWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha offset:(CGFloat)offset;

@end
