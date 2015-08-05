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

@property (nonatomic, readonly)NSArray *allItems;

+(instancetype)sharedStore;
-(BNRItem *)createItem;


@end
