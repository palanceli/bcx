//
//  main.m
//  lottery
//
//  Created by palance on 15/7/13.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

void sample1()
{
    NSMutableArray* array;
    array = [[NSMutableArray alloc] init];
    int i;
    for (i=0; i<10; i++){
        NSNumber* newNumber = [[NSNumber alloc]initWithInt:(i * 3)];
        [array addObject:newNumber];
    }
    for (i=0; i<10; i++){
        NSNumber* numberToPrint = [array objectAtIndex:i];
        NSLog(@"The number at index %d is %@", i, numberToPrint);
    }
}

void sample2()
{
    // 创建日期对象
    NSDate* now = [[NSDate alloc] init];
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* weekComponents = [[NSDateComponents alloc] init];
    
    // 创建随机数生成器
    srandom((unsigned)time(NULL));
    NSMutableArray* array;
    array = [[NSMutableArray alloc] init];
    
    int i;
    for(i=0; i<10; i++){
        weekComponents.day = 7 * i;
        
        // 创建日期对象，i周以前的
        NSDate* iWeeksFromNow;
        iWeeksFromNow = [cal dateByAddingComponents:weekComponents toDate:now options:0];
        
        // 创建新的LotteryEntry的实例
        LotteryEntry* newEntry = [[LotteryEntry alloc] init];
        [newEntry setEntryDate:iWeeksFromNow];
        
        // 将LotteryEntry对象加入到队列中
        [array addObject:newEntry];
        
        [newEntry release];
    }
    
    for(LotteryEntry* entryToPrint in array){
        // 显示内容
        NSLog(@"%@", entryToPrint);
    }
    
//    [array release];
    [now release];
//    [cal release];
    [weekComponents release];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        sample2();
    }
    return 0;
}
