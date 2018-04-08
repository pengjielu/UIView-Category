//
//  UIView+Category.h
//  GnetCommonFrame
//
//  Created by lpj on 16/2/24.
//  Copyright © 2016年 Ymac. All rights reserved.
//

#define kcscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height

#define kscaleX  kcscreenWidth/375.0
#define kscaleY  kscreenHeight/667.0

#define for5X  kcscreenWidth/320.0
#define for5Y  kscreenHeight/568.0
#import <UIKit/UIKit.h>

@interface UIView (Category)

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

//- (void)fitForiphone6:(int)i; //适配iphone6.iphone6plus
//- (void)fitForiphone5:(int)i;
//- (void)fitForiphone:(int)i;
- (void)adaptiveFor5:(UIView *)view;
- (void)adaptive:(UIView *)view;
CGRect  CustomRectMake(CGFloat left,CGFloat top,CGFloat width,CGFloat height);
+ (UIView *)creatView:(CGRect)frame color:(UIColor *)color View:(UIView *)fatherView;
- (void)drawLine:(CGRect)frame color:(UIColor *)color;
- (void)drawCircleRect:(CGRect)rect color:(UIColor *)color;
+ (UIWindow *)getLastWindow;
//- (UIViewController *)viewGetCurrentViewController;
@end
