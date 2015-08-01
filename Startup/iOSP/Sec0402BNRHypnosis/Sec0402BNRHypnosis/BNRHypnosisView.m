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
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    path.lineWidth = 10;
    [[UIColor lightGrayColor]setStroke];
    [path stroke];
}

@end
