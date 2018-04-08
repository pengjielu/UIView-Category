//
//  UIView+Category.m
//  GnetCommonFrame
//
//  Created by lpj on 16/2/24.
//  Copyright © 2016年 Ymac. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

CGRect  NewCustomRectMake(CGFloat left,CGFloat top,CGFloat width,CGFloat height) //适配6、6plus
{
    CGRect newRect = CGRectZero;
    newRect.origin.x = left*kscaleX;
    newRect.origin.y = top*kscaleX;
    newRect.size.width = width*kscaleX;
    newRect.size.height = height*kscaleX;
    return newRect;
}

- (void)adaptiveFor5:(UIView *)view {
    if ([view isEqual:self]) {
        self.frame = RectMake(self.left, self.top, self.width, self.height);
    }
    for (UIView *subView in [view subviews]) {
        //        if (!self.subviews.count) {
        //            return;
        //        }
        if (subView.tag != 100000 ) {
            subView.frame = RectMake(subView.left, subView.top, subView.width, subView.height);
        }else if (subView.tag == 100000) {
            subView.frame = RectMake(subView.left, subView.top, subView.width, kPX1);
            subView.backgroundColor = [UIColor cujcolorWithHexString:@"#eaeaea"];
        }
        [self adaptive:subView];
    }
    
}

- (void)adaptive:(UIView *)view {
    if ([view isEqual:self]) {
        self.frame = NewCustomRectMake(self.left, self.top, self.width, self.height);
    }
    for (UIView *subView in [view subviews]) {
        //        if (!self.subviews.count) {
        //            return;
        //        }
        if (subView.tag != 100000 ) {
            subView.frame = NewCustomRectMake(subView.left, subView.top, subView.width, subView.height);
        }else if (subView.tag == 100000) {
            subView.frame = NewCustomRectMake(subView.left, subView.top, subView.width, kPX1);
            subView.backgroundColor = [UIColor cujcolorWithHexString:@"#eaeaea"];
        }
        [self adaptive:subView];
    }
}

CGRect  RectMake(CGFloat left,CGFloat top,CGFloat width,CGFloat height) //适配6、6plus
{
    CGRect newRect = CGRectZero;
    newRect.origin.x = left*for5X;
    newRect.origin.y = top*for5X;
    newRect.size.width = width*for5X;
    newRect.size.height = height*for5X;
    return newRect;
}

+ (UIView *)creatView:(CGRect)frame color:(UIColor *)color View:(UIView *)fatherView{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    [fatherView addSubview:view];
    return view;
}

- (void)drawLine:(CGRect)frame color:(UIColor *)color {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    //设置线宽
    CGContextSetLineWidth(ctx, 0);
    //设置填充颜色和画笔颜色
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    //找到各个角点
    CGPoint p_0_0 = CGPointMake(5, 2);
    CGPoint p_0_1 = CGPointMake(frame.size.width, 2);
    CGPoint p_1_0 = CGPointMake(0, frame.size.height - 2);
    CGPoint p_1_1 = CGPointMake(frame.size.width - 5, frame.size.height - 2);
    
    CGContextMoveToPoint(ctx, p_1_0.x , p_1_0.y - 2 * 2);
    CGContextAddArcToPoint(ctx, p_0_0.x, p_0_0.y, p_0_0.x + 2*2, p_0_0.y, 2);
    CGContextAddArcToPoint(ctx, p_0_1.x, p_0_1.y, p_0_1.x, p_0_1.y  + 2*2, 2);
    CGContextAddArcToPoint(ctx, p_1_1.x, p_1_1.y, p_1_1.x - 2*2, p_1_1.y, 2);
    CGContextAddArcToPoint(ctx, p_1_0.x, p_1_0.y, p_1_0.x, p_1_0.y - 2*2, 2);
    
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

- (void)drawCircleRect:(CGRect)rect  color:(UIColor *)color {
    // 画圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 4);
    // 2.画圆
    CGContextAddEllipseInRect(ctx, rect);
    
    [color set];
    
    // 3.渲染
    CGContextStrokePath(ctx);
}

+ (UIWindow *)getLastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

//当前视图
- (UIViewController *)viewGetCurrentViewController {
    UIViewController *vc;
    for (UIView *view in self.subviews) {
        for (UIView *next = view; next; next = next.superview) {
            UIResponder* nextResponder = [next nextResponder];
            if ([nextResponder isKindOfClass:[objc_getClass("UIViewController") class]] ) {
                vc=(UIViewController*)nextResponder;
                return vc;
            }
        }
    }
    return vc;
}

@end
