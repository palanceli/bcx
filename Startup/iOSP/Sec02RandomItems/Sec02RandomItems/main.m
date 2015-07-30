//
//  main.m
//  Sec02RandomItems
//
//  Created by palance on 15/7/30.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray  *items = [[NSMutableArray alloc]init];
        
        for(int i=0; i < 10; i++){
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        for(BNRItem *item in items){
            NSLog(@"%@", item);
        }
    }
    return 0;
}
