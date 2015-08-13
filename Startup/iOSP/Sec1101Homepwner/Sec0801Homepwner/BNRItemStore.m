//
//  BNRItemStore.m
//  Sec0801Homepwner
//
//  Created by palance on 15/8/3.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property (nonatomic)NSMutableArray *privateItemsMoreThan50;
@property (nonatomic)NSMutableArray *privateItemsLittleThan50;

@end

@implementation BNRItemStore
+(instancetype)sharedStore
{
    static BNRItemStore * sharedStroe = nil;
    if(sharedStroe == nil){
        sharedStroe = [[BNRItemStore alloc]initPrivate];
    }
    return sharedStroe;
}

-(NSArray*)allItemsMoreThan50
{
    return self.privateItemsMoreThan50;
}

-(NSArray*)allItemsLittleThan50
{
    return self.privateItemsLittleThan50;
}

-(BNRItem *)createItem
{
    BNRItem *newItem = [BNRItem randomItem];
    if (newItem.valueInDollar > 50) {
        [self.privateItemsMoreThan50 addObject:newItem];
    }else{
        [self.privateItemsLittleThan50  addObject:newItem];
    }
    return newItem;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedStore]" userInfo:nil];
}

-(instancetype)initPrivate
{
    self = [super init];
    if(self){
        _privateItemsLittleThan50 = [[NSMutableArray alloc]init];
        _privateItemsMoreThan50 = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)removeItem:(BNRItem *)item
{
    if ([self.privateItemsLittleThan50 indexOfObject:item] != NSNotFound) {
        [self.privateItemsLittleThan50 removeObjectIdenticalTo:item];
    }else{
        [self.privateItemsMoreThan50 removeObjectIdenticalTo:item];
    }
}

-(void)moveSectionItem:(NSInteger)section AtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if(fromIndex == toIndex)
        return;
    NSMutableArray *items = nil;
    if (section == 0)
        items = self.privateItemsLittleThan50;
    else
        items = self.privateItemsMoreThan50;
    
    BNRItem *item = items[fromIndex];
    [items removeObjectAtIndex:fromIndex];
    [items insertObject:item atIndex:toIndex];
}

-(NSString*)description
{
    NSString* descriptionString = [NSString stringWithFormat:@"小于50：%@\n大于50：%@\n", self.privateItemsLittleThan50, self.privateItemsMoreThan50];
    return descriptionString;
}

-(void)updateAllItems
{
    NSMutableArray *items = [[NSMutableArray alloc]init];
    for (BNRItem *item in self.privateItemsLittleThan50) {
        [items addObject:item];
    }
    for (BNRItem *item in self.privateItemsMoreThan50) {
        [items addObject:item];
    }
    [self.privateItemsLittleThan50 removeAllObjects];
    [self.privateItemsMoreThan50 removeAllObjects];
    for (BNRItem *item in items) {
        if (item.valueInDollar > 50){
            [self.privateItemsMoreThan50 addObject:item];
        }else{
            [self.privateItemsLittleThan50 addObject:item];
        }
    }
}
@end
