//
//  ViewController.m
//  SampleE
//
//  Created by palance on 15/10/12.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIView* viewA;
@property (nonatomic, strong) UIView* viewB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    CGRect rect = self.scrollView.bounds;
    rect.size.width *= 2;
    self.scrollView.contentSize = rect.size;
    self.scrollView.pagingEnabled = YES;

    CGRect rtViewA = self.scrollView.bounds;
    self.viewA = [[UIView alloc]initWithFrame:rtViewA];
    self.viewA.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:self.viewA];
    
    CGRect rtViewB = self.scrollView.bounds;
    rtViewB.origin.x += rtViewA.size.width;
    self.viewB = [[UIView alloc]initWithFrame:rtViewB];
    self.viewB.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:self.viewB];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGRect rect = self.scrollView.bounds;
    rect.size.width *= 2;
    self.scrollView.contentSize = rect.size;
    
//    CGRect rtViewA = self.scrollView.bounds;
//    self.viewA.frame = rtViewA;
//    
//    CGRect rtViewB = self.scrollView.bounds;
//    rtViewB.origin.x += rtViewA.size.width;
//    self.viewB.frame = rtViewB;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
