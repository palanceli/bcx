//
//  ViewController.m
//  Random
//
//  Created by palance on 15/7/12.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)generate:(id)sender
{
    // 产生 1 到 100 间的整数
    int generated;
    generated = (int)(random() % 100) + 1;
    
    NSLog(@"generated = %d", generated);
    
    // 请求文本框改变显示内容
    [textField setIntValue:generated];
}

- (IBAction)seed:(id)sender
{
    // 产生与时间相关的随机数
    srandom((unsigned)time(NULL));
    [textField setStringValue:@"Generator seeded"];
}

@end
