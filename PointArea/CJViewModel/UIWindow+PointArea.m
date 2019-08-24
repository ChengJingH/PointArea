//
//  UIWindow+PointArea.m
//  PointArea
//
//  Created by walen on 2019/7/29.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "UIWindow+PointArea.h"
#import <objc/runtime.h>

@implementation UIWindow (PointArea)

static double relative_x = 0.0;
static double relative_y = 0.0;

+ (void)load
{
    Method orgin_method = class_getInstanceMethod(self, @selector(sendEvent:));
    Method replace_method = class_getInstanceMethod(self, @selector(cj_sendEvent:));
    
    //方法交换
    method_exchangeImplementations(orgin_method, replace_method);
}

// called by UIApplication to dispatch events to views inside the window
- (void)cj_sendEvent:(UIEvent *)event
{
    [self cj_sendEvent:event];
    
    //清除全局初始化区域数据
    relative_x = 0.0;
    relative_y = 0.0;
    
    UITouch *tapTouch = event.allTouches.allObjects.lastObject;
    if (tapTouch.phase == UITouchPhaseEnded) {
//        NSLog(@"事件结束 ~ %@",tapTouch);
        UIView *touchView = tapTouch.view;
        touchView.layer.borderWidth = 1.0;
        touchView.layer.borderColor = [UIColor redColor].CGColor;
        
        //红点展示
        CGPoint point = [self calculatePointToWindow:touchView];
        NSLog(@"point ~ %@",NSStringFromCGPoint(point));
        UIView *redHotView = [[UIView alloc] initWithFrame:CGRectMake(point.x-5.0, point.y-5.0, 10, 10)];
        redHotView.backgroundColor = [UIColor redColor];
        redHotView.layer.cornerRadius = 5.0;
        redHotView.layer.masksToBounds = YES;
        [self addSubview:redHotView];
        
//        延时操作
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //边框消失
            touchView.layer.borderWidth = 0.0;
            touchView.layer.borderColor = [UIColor redColor].CGColor;
            
            //红点消失
            [redHotView removeFromSuperview];
        });
        
        
        
    }else if (tapTouch.phase == UITouchPhaseBegan){
//        NSLog(@"事件开始 ~ %@",tapTouch);
    }
    
}

//计算相对位置
- (CGPoint)calculatePointToWindow:(UIView *)touchView
{
    CGRect frameRect = touchView.frame;
    CGRect boundRect = touchView.bounds;
    
    if ([touchView isMemberOfClass:UIWindow.class]) {
        return CGPointMake(relative_x, relative_y);
    }else{
        //相对自身坐标偏移
        relative_x += boundRect.origin.x;
        relative_y += boundRect.origin.y;
        
        //相对父视图偏移
        relative_x += frameRect.origin.x;
        relative_y += frameRect.origin.y;
        
        return [self calculatePointToWindow:touchView.superview];
    }
}


@end
