//
//  ViewController.m
//  Sec0502Hypnosis
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rectView = self.view.bounds;
    rectView.size.width *= 2.0;
    rectView.size.height *= 2.0;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = rectView.size;
    [self.view addSubview:scrollView];
    
    HypnosisView * hypnosisView = [[HypnosisView alloc]initWithFrame:rectView];
    [scrollView addSubview:hypnosisView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
