//
//  ViewController.m
//  获取图片点击位置的颜色
//
//  Created by alan on 6/27/16.
//  Copyright © 2016 bjdv. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ColorAtPixel.h"
#import "UIColor+FuzzyCompare.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) UILabel *areaLabel;

@property (weak, nonatomic) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    UIImage *image = [UIImage imageNamed:@"map.jpg"];
    self.image = image;
    self.imageView.image = _image;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.areaLabel];
}

#pragma mark - Private Methods
- (NSString *)areaConfirmedByColor:(UIColor *)color configs:(NSArray *)configs{
    for (NSDictionary *config in configs) {
        if ([color fuzzyCompareWithRed:[config[@"red"] floatValue] green:[config[@"green"] floatValue] blue:[config[@"blue"] floatValue]]) {
            return config[@"area"];
        }
    }
    return nil;
}

#pragma mark - System Methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.view != self.imageView) {
        return;
    }
    CGPoint location = [touch locationInView:self.imageView];
    UIColor *color = [self.imageView.image colorAtPixel:location scaleX:CGRectGetWidth(self.imageView.frame) / _image.size.width scaleY:CGRectGetHeight(self.imageView.frame) / _image.size.height];
    NSArray *configs = @[@{@"area" : @"西北地区", @"red" : @(0.898039), @"green" : @(0.619608), @"blue" : @(0.996078)}, @{@"area" : @"西南地区", @"red" : @(0), @"green" : @(0.831373), @"blue" : @(0.913725)}, @{@"area" : @"华北地区", @"red" : @(0.996078), @"green" : @(0.690196), @"blue" : @(0.27451)}, @{@"area" : @"华中地区", @"red" : @(0.976471), @"green" : @(0.247059), @"blue" : @(0.705882)}, @{@"area" : @"华南地区", @"red" : @(0.701961), @"green" : @(0.87451), @"blue" : @(0.00784314)}, @{@"area" : @"华东地区", @"red" : @(0.192157), @"green" : @(0.580392), @"blue" : @(0.952941)}, @{@"area" : @"东北地区", @"red" : @(0.662745), @"green" : @(0.819608), @"blue" : @(0.0588235)}];
    self.areaLabel.text = [self areaConfirmedByColor:color configs:configs];
    NSLog(@"%@",color);
}

#pragma mark - Getter and Setter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), 350)];
    }
    return _imageView;
}

- (UILabel *)areaLabel {
    if (!_areaLabel) {
        _areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, CGRectGetWidth(self.view.bounds), 350)];
        _areaLabel.textAlignment = NSTextAlignmentCenter;
        _areaLabel.textColor = [UIColor blackColor];
    }
    return _areaLabel;
}

@end
