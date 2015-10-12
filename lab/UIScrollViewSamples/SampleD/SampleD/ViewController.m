//
//  ViewController.m
//  SampleD
//
//  Created by palance on 15/10/12.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = self.scrollView.bounds;
    rect.size.width *= 2;
    self.scrollView.contentSize = rect.size;
    self.scrollView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
