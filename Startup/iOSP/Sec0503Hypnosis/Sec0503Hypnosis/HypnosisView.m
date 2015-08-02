//
//  HypnosisView.m
//  Sec0503Hypnosis
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()
@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView
-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGPoint center;
    center.x = self.bounds.size.width / 2.0;
    center.y = self.bounds.size.height / 2.0;
    
    float maxRadius = hypot(self.bounds.size.width, self.bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    for (float radius=maxRadius; radius>0; radius -= 20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    [path setLineWidth:10];
    [self.circleColor setStroke];
    [path stroke];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    
    self.circleColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
