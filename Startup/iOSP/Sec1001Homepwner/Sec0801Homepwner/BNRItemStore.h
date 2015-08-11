//
//  BNRItemStore.h
//  Sec0801Homepwner
//
//  Created by palance on 15/8/3.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;


@interface BNRItemStore : NSObject

@property (nonatomic, readonly)NSArray *allItemsMoreThan50;
@property (nonatomic, readonly)NSArray *allItemsLittleThan50;

+(instancetype)sharedStore;
-(BNRItem *)createItem;
-(void)removeItem:(BNRItem*)item;
-(void)moveSectionItem:(NSInteger)section AtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
-(void)updateAllItems;

@end
