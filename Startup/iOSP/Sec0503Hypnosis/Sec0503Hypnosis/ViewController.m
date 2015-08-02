//
//  ViewController.m
//  Sec0503Hypnosis
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
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    CGRect rtView = self.view.bounds;
    rtView.size.width *= 2.0;
    scrollView.contentSize = rtView.size;
    [self.view addSubview:scrollView];
    
    HypnosisView * view1 = [[HypnosisView alloc]initWithFrame:self.view.bounds];
    [scrollView addSubview:view1];
    
    CGRect rtView2 = self.view.bounds;
    rtView2.origin.x = rtView2.size.width;
    HypnosisView *view2 = [[HypnosisView alloc]initWithFrame:rtView2];
    [scrollView addSubview:view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
