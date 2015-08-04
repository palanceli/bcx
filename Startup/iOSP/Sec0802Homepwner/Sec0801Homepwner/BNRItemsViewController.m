//
//  ViewController.m
//  Sec0801Homepwner
//
//  Created by palance on 15/8/3.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController ()

@end

@implementation BNRItemsViewController


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *strTitle = [NSString stringWithFormat:@"大于$50"];
    if(section == 0){
        strTitle = [NSString stringWithFormat:@"小于等于$50"];
    }
    return strTitle;
}

-(NSArray*)sectionItems:(NSInteger) section
{
    NSArray *items = [[BNRItemStore sharedStore]allItems];

    NSPredicate * predicate = nil;
    if(section == 0){
        predicate = [NSPredicate predicateWithFormat:@"valueInDollar<=50"];
    }else{
        predicate = [NSPredicate predicateWithFormat:@"valueInDollar>50"];
    }
    return [items filteredArrayUsingPredicate:predicate];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *items = [self sectionItems:section];
    if (section == 0) {
        return items.count;
    }else{
        return items.count + 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 60;
    NSArray *items = [self sectionItems:1];
    if(indexPath.section == 1 && indexPath.row == items.count)
        height = 44;
    return height;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.5];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:cellForRowAtIndexPath %ld", (long)indexPath.row);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSArray *items = [self sectionItems:section];
    if(indexPath.section == 1 && indexPath.row == items.count){
        cell.textLabel.text = @"No More Items!";
    }else
        cell.textLabel.text = [items[indexPath.row] description];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    BNRItemStore * sharedStore = [BNRItemStore sharedStore];
    for (int i=0; i<20; i++) {
        [sharedStore createItem];
    }
    
    // 设置分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 设置背景图
    self.tableView.opaque = NO;
//    [self.tableView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoGCEA3.png"]];
    self.tableView.backgroundView = imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
