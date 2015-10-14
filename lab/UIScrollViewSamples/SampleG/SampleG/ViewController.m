//
//  ViewController.m
//  SampleG
//
//  Created by palance on 15/10/14.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.pagingEnabled = YES;
    CGRect rect = self.scrollView.frame;
    rect.size.width *= 2;
    self.scrollView.contentSize = rect.size;
    
    CGRect rtViewA = self.scrollView.bounds;
    UIView *viewA = [[UIView alloc]initWithFrame:rtViewA];
    viewA.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:viewA];
    
    CGRect rtViewB = self.scrollView.bounds;
    rtViewB.origin.x = rtViewA.size.width;
    UIView *viewB = [[UIView alloc]initWithFrame:rtViewB];
    viewB.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:viewB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
