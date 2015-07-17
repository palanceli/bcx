//
//  ViewController.m
//  CountChar
//
//  Created by palance on 15/7/16.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize textField = _textField;
@synthesize summary = _summary;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)countCharacters:(id)sender {
    NSString *stringValue = [_textField stringValue];
    NSUInteger nLength = [stringValue length];
    NSString * summaryString = [NSString stringWithFormat:@"'%@' has %lu characters", stringValue, nLength];
    [_summary setStringValue:summaryString];
}
@end
