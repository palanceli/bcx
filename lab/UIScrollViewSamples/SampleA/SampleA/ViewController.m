//
//  ViewController.m
//  SampleA
//
//  Created by palance on 15/10/5.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置scrollview的内容视图尺寸，打开paging模式
    CGRect contentRect = self.view.bounds;
    contentRect.size.width *= 2.0;
    self.scrollView.contentSize = contentRect.size;
    [self.scrollView setPagingEnabled:YES];
    
    // 添加第一个视图
    CGRect rtRedView = self.view.bounds;
    UIView *viewRed = [[UIView alloc]initWithFrame:rtRedView];
    viewRed.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:viewRed];
    // 添加第二个视图
    CGRect rtBlueView = self.view.bounds;
    rtBlueView.origin.x += self.view.bounds.size.width;
    UIView *viewBlue = [[UIView alloc]initWithFrame:rtBlueView];
    viewBlue.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:viewBlue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
