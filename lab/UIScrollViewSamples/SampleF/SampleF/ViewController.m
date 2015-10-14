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
@property (strong, nonatomic) UIView *viewA;
@property (strong, nonatomic) UIView *viewB;
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
    
    
//    CGRect rect = self.scrollView.frame;
//    rect.size.width *= 2;
////    rect.size.height -= self.navigationController.navigationBar.frame.size.height;
//    rect.size.height -= 64;
//    self.scrollView.contentSize = rect.size;
    self.scrollView.pagingEnabled = YES;
	
    self.viewA = [[UIView alloc]init];
    self.viewA.backgroundColor = [UIColor redColor];
	[self.scrollView addSubview:self.viewA];
	
    self.viewB = [[UIView alloc]init];
    self.viewB.backgroundColor = [UIColor blueColor];
	[self.scrollView addSubview:self.viewB];
}

-(void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	
	CGRect rect = self.scrollView.frame;
	rect.size.width *= 2;
	self.scrollView.contentSize = rect.size;
	
	CGRect rtViewA = self.scrollView.frame;
	rtViewA.origin.x = 0;
	rtViewA.origin.y = 0;
	self.viewA.frame = rtViewA;
	
	CGRect rtViewB = self.scrollView.frame;
	rtViewB.origin.x = rtViewB.size.width;
	rtViewB.origin.y = 0;
	self.viewB.frame = rtViewB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
