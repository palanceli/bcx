//
//  HypnosisView.m
//  Sec0601HynoNerd
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "HypnosisView.h"
@interface HypnosisView()
@property (strong, nonatomic)UIColor *circleColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSelector;

@end

@implementation HypnosisView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.circleColor = [UIColor redColor];
    }
    return self;
}

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    
    self.circleColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (IBAction)onSelectColor:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if(control == self.colorSelector){
        NSInteger x = control.selectedSegmentIndex;
        switch (x) {
            case 0:
                self.circleColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
                break;
            case 1:
                self.circleColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
                break;
            case 2:
                self.circleColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
                break;
                
            default:
                break;
        }
    }
    
   
}

-(void)drawRect:(CGRect)rect
{
    CGPoint center;
    center.x = self.bounds.size.width / 2.0;
    center.y = self.bounds.size.height / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    float maxRadius = hypot(self.bounds.size.width, self.bounds.size.height) / 2.0;
    for (float radius=maxRadius; radius>0; radius-=20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    [path setLineWidth:10];
    [self.circleColor setStroke];
    [path stroke];
}

@end
