//
//  GradualLabel.m
//  PointArea
//
//  Created by walen on 2019/10/16.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "GradualLabel.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation GradualLabel


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor redColor] set];
    rect.size.width *= 0.58;
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceIn);
}

@end
