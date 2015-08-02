//
//  ViewController.m
//  Sec05BNRHypnosis
//
//  Created by palance on 15/8/2.
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
    BNRHypnosisView *view = [[BNRHypnosisView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
