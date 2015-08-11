//
//  BNRDetailViewController.m
//  Sec0801Homepwner
//
//  Created by palance on 15/8/8.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRItemCreateTimeViewController.h"


@interface BNRDetailViewController()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@end

@implementation BNRDetailViewController

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = item.itemName;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameField.text = self.item.itemName;
    self.serialNumberField.text = self.item.itemSerial;
    self.valueField.text = [NSString stringWithFormat:@"%d", self.item.valueInDollar];
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil){
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    }
    self.dateField.text = [dateFormatter stringFromDate:self.item.createdDate];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.item.itemName = self.nameField.text;
    self.item.itemSerial = self.serialNumberField.text;
    self.item.valueInDollar = (int)[self.valueField.text integerValue];
}
- (IBAction)hideKeyboard:(id)sender
{
    [_nameField resignFirstResponder];
    [_serialNumberField resignFirstResponder];
    [_valueField resignFirstResponder];
}

- (IBAction)changeCreateTime:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BNRItemCreateTimeViewController *itemCreateTimeViewController = [storyboard instantiateViewControllerWithIdentifier:@"BNRItemCreateTimeViewController"];
    [self.navigationController pushViewController:itemCreateTimeViewController animated:YES];
    [itemCreateTimeViewController setItem:self.item];
}
@end
