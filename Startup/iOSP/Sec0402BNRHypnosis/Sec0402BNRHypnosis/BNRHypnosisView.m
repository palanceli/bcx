//
//  BNRHypnosisView.m
//  Sec0402BNRHypnosis
//
//  Created by palance on 15/8/1.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    // 绘制圆环
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    path.lineWidth = 10;
    [[UIColor lightGrayColor]setStroke];
    [path stroke];
    
    // 绘制三角形
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    UIBezierPath *pathTriangle = [[UIBezierPath alloc]init];
    CGPoint p0 = CGPointMake(center.x, center.y - 100);
    CGPoint p1 = CGPointMake(center.x + 100, center.y + 100);
    CGPoint p2 = CGPointMake(center.x - 100, center.y + 100);
    
    [pathTriangle moveToPoint:p0];
    [pathTriangle addLineToPoint:p1];
    [pathTriangle addLineToPoint:p2];
    [pathTriangle addLineToPoint:p0];
    [pathTriangle stroke];

    // 绘制阴影`
    CGContextSaveGState(currentContext);
    [pathTriangle addClip];

    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
                             1.0, 1.0, 0.0, 1.0};    // 终止颜色为黄色
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);

    CGPoint startPoint = CGPointMake(center.x, center.y - 100);
    CGPoint endPoint = CGPointMake(center.x, center.y + 100);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
    

    
    
    
    
    
    // 绘制一个带阴影的苹果
    currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    CGRect logoRect = CGRectMake(center.x - 50, center.y - 60, 100, 120);
    UIImage *logoImage = [UIImage imageNamed:@"苹果.png"];
    [logoImage drawInRect:logoRect];
    CGContextRestoreGState(currentContext);
}

@end
