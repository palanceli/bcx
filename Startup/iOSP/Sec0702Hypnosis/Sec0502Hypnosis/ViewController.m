//
//  ViewController.m
//  Sec0502Hypnosis
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController () <UIScrollViewDelegate>

@property HypnosisView* hypnosisView;
@property UIScrollView* scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rectView = self.view.bounds;
    rectView.size.width *= 2.0;
    rectView.size.height *= 2.0;
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.contentSize = rectView.size;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.delegate = self;
//    self.scrollView.scrollEnabled = YES;
//    self.scrollView.bounces = NO;
//    self.scrollView.bouncesZoom = NO;
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.maximumZoomScale = 2;
    [self.view addSubview:self.scrollView];
    
    self.hypnosisView = [[HypnosisView alloc]initWithFrame:rectView];
    [self.scrollView addSubview:self.hypnosisView];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"zooming...");
    return self.hypnosisView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
