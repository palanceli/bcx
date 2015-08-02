//
//  BNRReminderViewController.m
//  Sec0601HynoNerd
//
//  Created by palance on 15/8/2.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRReminderViewController.h"
@interface BNRReminderViewController()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"BNRReminderViewController loaded!");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"懒猪起床！";
    note.fireDate = date;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
}


@end
