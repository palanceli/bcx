//
//  main.m
//  Sec02RandomItems
//
//  Created by palance on 15/7/30.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRItemContainer.h"

void Sample()
{
    NSMutableArray  *items = [[NSMutableArray alloc]init];
    
    for(int i=0; i < 10; i++){
        BNRItem *item = [BNRItem randomItem];
        [items addObject:item];
    }
    for(BNRItem *item in items){
        NSLog(@"%@", item);
    }
    //NSLog(@"%@", items[11]);
    items = nil;
    NSLog(@"Sample return.");
}

void Sample2(NSObject** p)
{
    *p = [BNRItem randomItem];
}

void Test2_10()
{
    BNRItemContainer * itemContainer = [[BNRItemContainer alloc]initWithItemName:@"Container1" serialNumber:@"C1" valueInDollar:100];
    for(int i=0; i<3; i++){
        BNRItem *item = [BNRItem randomItem];
        [itemContainer addItem:item];
    }
    BNRItemContainer *itemContainer2 = [[BNRItemContainer alloc]initWithItemName:@"Container2" serialNumber:@"C2" valueInDollar:200];
    for(int i=0; i<2; i++){
        BNRItem *item = [BNRItem randomItem];
        [itemContainer2 addItem:item];
    }
    [itemContainer addItem:itemContainer2];
    NSLog(@"%@", itemContainer);
}

int main(int argc, const char * argv[]) {
    NSObject * p = nil;
    @autoreleasepool {
//        Test2_10();
//        Sample();
        Sample2(&p);
        NSLog(@"%@", p);
    }
    NSLog(@"%@", p);
    NSLog(@"Main will return.");
    return 0;
}
