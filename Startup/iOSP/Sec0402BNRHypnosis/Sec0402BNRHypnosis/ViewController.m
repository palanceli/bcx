//
//  ViewController.m
//  Sec0402BNRHypnosis
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
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect firstFrame = self.view.bounds;
    
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc]initWithFrame:firstFrame];
    
    [self.view addSubview:firstView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
