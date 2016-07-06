//
//  UIView+Category.h
//  FamilyTree
//
//  Created by zhangheng on 16/5/16.
//  Copyright © 2016年 北京金色乐途科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)


CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property CGFloat centerX;
@property CGFloat centerY;

- (CGPoint)topLeft;
- (CGPoint)bottomLeft;

- (void) setCorner:(float) r;
+ (UIView *)createLineView:(UIView *)superView;
+ (UIView *)createLineView:(UIView *)superView frame:(CGRect)rect;
+ (UIView *)createLineViewInTop:(UIView *)superView;
+ (UIView *)createLineViewInbottom:(UIView *)superView;
+ (void)createTapGestureInView:(UIView *)view target:(id)target action:(SEL)selector;


@end
