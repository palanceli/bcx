//
//  HypnosisView.m
//  Sec0601HynoNerd
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "HypnosisView.h"
@interface HypnosisView() <UITextFieldDelegate>

@property (strong, nonatomic)UIColor *circleColor;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation HypnosisView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)drawHypnoticMessage:(NSString *)message
{
    for(int i=0; i<10; i++){
        UILabel * label = [[UILabel alloc]init];
        
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = message;
        [label sizeToFit];
        
        int width = self.bounds.size.width - label.bounds.size.width;
        int x = arc4random() % width;
        int height = self.bounds.size.height - label.bounds.size.height;
        int y = arc4random() % height;
        
        CGRect rtLabel = label.frame;
        rtLabel.origin.x = x;
        rtLabel.origin.y = y;
        label.frame = rtLabel;
        
        [self addSubview:label];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
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
