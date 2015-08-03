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
@property (nonatomic)NSMutableArray *privateItems;

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

-(NSArray*)allItems
{
    return self.privateItems;
}

-(BNRItem *)createItem
{
    BNRItem *newItem = [BNRItem randomItem];
    [self.privateItems addObject:newItem];
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
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
