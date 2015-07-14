//
//  LotteryEntry.m
//  lottery
//
//  Created by palance on 15/7/13.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry

-(id)initWithEntryDate:(NSDate *)theDate
{
    self = [super init];
    if(self){
        entryDate = [theDate retain];
        firstNumber = ((int)random() % 100 ) + 1;
        secondNumber = ((int)random() % 100) + 1;
    }
    return self;
}

-(id)init
{
    return [self initWithEntryDate:[NSDate date] ];
}

-(void)setEntryDate:(NSDate *)date
{
    [date retain];
    [entryDate release];
    entryDate = date;
}

-(NSDate*)entryDate
{
    return entryDate;
}

-(int)firstNumber
{
    return firstNumber;
}

-(int)secondNumber
{
    return secondNumber;
}

-(NSString*)description
{
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [df setDateStyle:NSDateFormatterMediumStyle];
    NSString* result;
    result = [NSString stringWithFormat:@"%@ = %d and %d", [df stringFromDate:entryDate],
              firstNumber, secondNumber];
    [df release];
    return result;
}

-(void)dealloc
{
    NSLog(@"deallocating %@", self);
    [entryDate release];
    [super dealloc];
}

@end
