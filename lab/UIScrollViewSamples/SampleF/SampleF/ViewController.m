//
//  ViewController.m
//  SampleF
//
//  Created by palance on 15/10/13.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    CGRect rect = self.scrollView.frame;
    rect.size.width *= 2;
//    rect.size.height -= self.navigationController.navigationBar.frame.size.height;
    rect.size.height -= 64;
    self.scrollView.contentSize = rect.size;
    self.scrollView.pagingEnabled = YES;
    
    CGRect rtA = self.scrollView.bounds;
    UIView *viewA = [[UIView alloc]initWithFrame:rtA];
    viewA.backgroundColor = [UIColor redColor];
    
    CGRect rtB = self.scrollView.bounds;
    rtB.origin.x += rtA.size.width;
    UIView *viewB = [[UIView alloc]initWithFrame:rtB];
    viewB.backgroundColor = [UIColor blueColor];
    
    [self.scrollView addSubview:viewA];
    [self.scrollView addSubview:viewB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
