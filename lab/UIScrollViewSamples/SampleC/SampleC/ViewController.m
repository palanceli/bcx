//
//  ViewController.m
//  SampleC
//
//  Created by palance on 15/10/10.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect = self.scrollView.frame;
    rect.size.width *= 2;
    self.scrollView.contentSize = rect.size;
    NSLog(@"(%d, %d), (%d, %d)", (int)self.scrollView.frame.origin.x, (int)self.scrollView.frame.origin.y, (int)self.scrollView.frame.size.width, (int)self.scrollView.frame.size.height);
    NSLog(@"(%d, %d)", (int)self.scrollView.contentSize.width, (int)self.scrollView.contentSize.height);
    
    CGRect rtViewA = self.scrollView.bounds;
    UIView *viewA = [[UIView alloc]initWithFrame:rtViewA];
    viewA.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:viewA];
    
    CGRect rtViewB = self.scrollView.bounds;
    rtViewB.origin.x += rtViewB.size.width;
    UIView *viewB = [[UIView alloc]initWithFrame:rtViewB];
    viewB.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:viewB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
