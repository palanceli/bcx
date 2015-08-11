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
#import "BNRDetailViewController.h"

@interface BNRItemsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButtonItem;
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
    if(section == 0)
        return [[BNRItemStore sharedStore]allItemsLittleThan50];
    else
        return [[BNRItemStore sharedStore]allItemsMoreThan50];
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
    for (int i=0; i<4; i++) {
        [sharedStore createItem];
    }
    
    // 设置分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 设置背景图
    self.tableView.opaque = NO;
//    [self.tableView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoGCEA3.png"]];
    self.tableView.backgroundView = imageView;
    
    
    self.navigationItem.title = @"Homepwner";
    
    UIOffset offset = {-10, 0};
    [self.rightBarButtonItem setTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleEditingMode:(id)sender {
    // 如果当前的视图控制对象已经处在编辑模式
    if(self.isEditing){
        // 关闭编辑模式
        [self setEditing:NO animated:YES];
        self.navigationItem.leftBarButtonItem.title = @"编辑";
    }else{
        // 开启编辑模式
        [self setEditing:YES animated:YES];
        self.navigationItem.leftBarButtonItem.title = @"完成";
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

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items1 = [self sectionItems:1];
    
    
    if (indexPath.section == 1 && indexPath.row == items1.count)
        return;
    // 如果UITableView对象请求确认的是删除操作
    if(editingStyle == UITableViewCellEditingStyleDelete){
        BNRItem *item = nil;
        item = [self sectionItems:indexPath.section][indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        // 删除表格控件中的相应表格行
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// 编辑模式下，删除按钮的文字
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath.section != destinationIndexPath.section) {
        return;
    }
    NSLog(@"排序前:%@", [BNRItemStore sharedStore]);
    [[BNRItemStore sharedStore]moveSectionItem:sourceIndexPath.section AtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    NSLog(@"排序后:%@", [BNRItemStore sharedStore]);
}

// 确保最后一行的位置固定
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    // 禁止跨行移动
    if (sourceIndexPath.section != proposedDestinationIndexPath.section)
        return sourceIndexPath;
    
    // 禁止移动最后一项
    if (sourceIndexPath.section == 1 && sourceIndexPath.row == [[BNRItemStore sharedStore] allItemsMoreThan50].count) {
        return sourceIndexPath;
    }
    
    // 禁止把任何一项移动到最后一项的下面
    if (proposedDestinationIndexPath.section == 1 && proposedDestinationIndexPath.row == [[BNRItemStore sharedStore]allItemsMoreThan50].count){
        return sourceIndexPath;
    }
    NSLog(@"(%lu, %lu) => (%lu, %lu)", sourceIndexPath.section, sourceIndexPath.row, proposedDestinationIndexPath.section, proposedDestinationIndexPath.row);
    return proposedDestinationIndexPath;
}

// 把最后一行设为不可删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == [[BNRItemStore sharedStore] allItemsMoreThan50].count) {
        return UITableViewCellEditingStyleNone;
    }
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"  bundle:nil];
    BNRDetailViewController * detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

    NSArray *allItems = nil;
    if (indexPath.section == 0) {
        allItems = [BNRItemStore sharedStore].allItemsLittleThan50;
    }else{
        allItems = [BNRItemStore sharedStore].allItemsMoreThan50;
    }
    
    detailViewController.item = allItems[indexPath.row];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[BNRItemStore sharedStore] updateAllItems];
    [self.tableView reloadData];
}
@end
