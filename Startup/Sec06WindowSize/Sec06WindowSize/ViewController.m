//
//  ViewController.m
//  Sec06WindowSize
//
//  Created by palance on 15/7/24.
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

-(NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    NSSize newSize = frameSize;
    newSize.height = newSize.width * 2;
    return newSize;
}

@end
