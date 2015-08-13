//
//  BNRItemCreateTimeViewController.m
//  Sec0801Homepwner
//
//  Created by palance on 15/8/11.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItemCreateTimeViewController.h"
#import "BNRItem.h"

@interface BNRItemCreateTimeViewController()

@property (weak, nonatomic) IBOutlet UIDatePicker *createdDate;

@property (weak, nonatomic) IBOutlet UIDatePicker *createdTime;

@end

@implementation BNRItemCreateTimeViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.createdDate setDate:self.item.createdDate];
    [self.createdTime setDate:self.item.createdDate];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSDateFormatter *datefmt = [[NSDateFormatter alloc]init];
    [datefmt setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [datefmt stringFromDate:self.createdDate.date];
    
    NSDateFormatter *timefmt = [[NSDateFormatter alloc]init];
    [timefmt setDateFormat:@"HH:mm:ss"];
    NSString *timeString = [timefmt stringFromDate:self.createdTime.date];
    
    NSString *dateTimeString = [NSString stringWithFormat:@"%@ %@", dateString, timeString];
    NSDateFormatter *dateTimeFormatter = [[NSDateFormatter alloc]init];
    [dateTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.item.createdDate = [dateTimeFormatter dateFromString:dateTimeString];
}
@end
