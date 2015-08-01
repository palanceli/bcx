//
//  ViewController.m
//  Sec04Hypnosister
//
//  Created by palance on 15/8/1.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc]initWithFrame:firstFrame];
    firstView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:firstView];
    
    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
    BNRHypnosisView *secondView = [[BNRHypnosisView alloc]initWithFrame:secondFrame];
    secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:secondView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
