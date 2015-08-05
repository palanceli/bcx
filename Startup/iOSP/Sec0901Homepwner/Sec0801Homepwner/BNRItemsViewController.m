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
@property (weak, nonatomic) IBOutlet UIView *headerView;

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
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.7];
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
    for (int i=0; i<10; i++) {
        [sharedStore createItem];
    }
    
    // 设置分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 设置背景图
    self.tableView.opaque = NO;
//    [self.tableView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoGCEA3.png"]];
    self.tableView.backgroundView = imageView;
    
    [self.tableView setTableHeaderView:self.headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleEditingMode:(id)sender {
    // 如果当前的视图控制对象已经处在编辑模式
    if(self.isEditing){
        // 修改按钮文字，提示用户当前的表格状态
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        // 关闭编辑模式
        [self setEditing:NO animated:YES];
    }else{
        // 修改按钮文字，提示用户当前的表格状态
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        // 开启编辑模式
        [self setEditing:YES animated:YES];
    }
}
- (IBAction)addNewItem:(id)sender {
    // 创建新的BNRItem对象并将其加入BNRItemStore对象
    BNRItem *newItem = [[BNRItemStore sharedStore]createItem];
    
    // 获取新创建的对象在allItems数组中的索引
    NSArray *items0 = [self sectionItems:0];
    NSArray *items1 = [self sectionItems:1];
    NSInteger section = 0;
    NSInteger lastRow = [items0 indexOfObject:newItem];
    if (lastRow != NSNotFound) {
        section = 0;
    }else{
        lastRow = [items1 indexOfObject:newItem];
        section = 1;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:section];
    
    // 将新行插入UITableView对象
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}
@end
