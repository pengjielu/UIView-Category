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
/**
 *  适配方法
 *
 *  @param tag=100000，是适配线条，当前线条高度始终为1，当前方法最多适配四层，如需更多请自行添加
 */
- (void)fitForiphone:(int)i
{
    self.frame = CustomRectMake(self.left, self.top, self.width, self.height);
    if (i==1) {
        for (UIView *myView  in self.subviews) {
            if (myView.tag != 100000 ) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
            }else if (myView.tag == 100000) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, 1);
            }
            
        }
    }
    
    
    if (i==2) {
        for (UIView *myView  in self.subviews) {
            if (myView.tag != 100000 ) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
                for (UIView *twoSubView in myView.subviews) {
                    if (twoSubView.tag == 100000) {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, 1);
                    }else {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, twoSubView.height);
                    }
                }
            }else if (myView.tag == 100000) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, 1);
            }
        }
    }
    
    
    
    if (i==3)
    {
        for (UIView *myView  in self.subviews) {
            if (myView.tag != 100000 ) {
                
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
                
                for (UIView *twoSubView in myView.subviews) {
                    if (twoSubView.tag != 100000 ) {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, twoSubView.height);
                        for (UIView *threeView in twoSubView.subviews) {
                            if (threeView.tag != 100000 ) {
                                threeView.frame = CustomRectMake(threeView.left, threeView.top, threeView.width, threeView.height);
                            }else if (threeView.tag == 100000) {
                                threeView.frame = CustomRectMake(threeView.left, threeView.top, threeView.width, 1);
                            }
                        }
                    }else if (twoSubView.tag == 100000) {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, 1);
                    }
                }
            }else if (myView.tag == 100000) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, 1);
            }
        }
    }
    
    if (i==4) {
        for (UIView *myView  in self.subviews) {
            if (myView.tag != 100000 ) {
                
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
                
                for (UIView *twoSubView in myView.subviews) {
                    if (twoSubView.tag != 100000) {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, twoSubView.height);
                        for (UIView *threeView in twoSubView.subviews) {
                            if (threeView.tag != 100000) {
                                threeView.frame = CustomRectMake(threeView.left, threeView.top, threeView.width, threeView.height);
                                for (UIView *fourView  in threeView.subviews) {
                                    if (fourView.tag != 100000) {
                                        fourView.frame = CustomRectMake(fourView.left, fourView.top, fourView.width, fourView.height);
                                    }else if (fourView.tag == 100000) {
                                        fourView.frame = CustomRectMake(fourView.left, fourView.top, fourView.width, 1);
                                    }
                                }
                            }else if (threeView.tag == 100000) {
                                threeView.frame = CustomRectMake(threeView.left, threeView.top, threeView.width, 1);
                            }
                        }
                    }else if (twoSubView.tag == 100000) {
                        twoSubView.frame = CustomRectMake(twoSubView.left, twoSubView.top, twoSubView.width, 1);
                    }
                }
            }else if (myView.tag == 100000) {
                myView.frame = CustomRectMake(myView.left, myView.top, myView.width, 1);
            }
        }
    }
    
    if (i==101) {
        // Array 里的第一个 对象
        UIView *myView = [self.subviews objectAtIndex:0];
        myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
    }
    
    if (i==102) {
        // Array 里的第2个 对象
        UIView *myView = [self.subviews objectAtIndex:1];
        myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
    }
    
    if (i==103) {
        // Array 里的最后一个 对象
        UIView *myView = [self.subviews lastObject];
        myView.frame = CustomRectMake(myView.left, myView.top, myView.width, myView.height);
    }
    
}

CGRect  CustomRectMake(CGFloat left,CGFloat top,CGFloat width,CGFloat height) //适配6、6plus
{
    CGRect newRect = CGRectZero;
    newRect.origin.x = left*scaleX;
    newRect.origin.y = top*scaleY;
    newRect.size.width = width*scaleX;
    newRect.size.height = height*scaleY;
    return newRect;
}
@end
