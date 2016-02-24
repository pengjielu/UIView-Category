//
//  UIView+Category.h
//  GnetCommonFrame
//
//  Created by lpj on 16/2/24.
//  Copyright © 2016年 Ymac. All rights reserved.
//

#define kcscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height

#define scaleX  kcscreenWidth/320.0
#define scaleY  kscreenHeight/568.0
#import <UIKit/UIKit.h>

@interface UIView (Category)

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;
/**
 *  多屏适配方法
 *  当前方法用iphone5为基准屏，如果需要直接修改scaleX\scaleY
 *  iphone5、5s 320.0 568.0  iphone6/6s 375.0 667.0  iphone6p/6sp 414.0 736.0
 *  @param i i是需要适配几层View
 */
- (void)fitForiphone:(int)i;
CGRect  CustomRectMake(CGFloat left,CGFloat top,CGFloat width,CGFloat height);
@end
