//
//  BNRItem.m
//  Sec0801Homepwner
//
//  Created by palance on 15/8/3.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(instancetype)init
{
    return [self initWithName:@"" serial:@"" valueInDollar:0];
}

-(instancetype)initWithName:(NSString *)itemName serial:(NSString *)serial valueInDollar:(int)valueInDollar
{
    self = [super init];
    if(self){
        _itemName = itemName;
        _itemSerial = serial;
        _valueInDollar = valueInDollar;
        _createdDate = [[NSDate alloc]init];
    }
    return self;
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"%@ (%@): Worth %d, recorded on %@", self.itemName, self.itemSerial, self.valueInDollar, self.createdDate];
}

+(instancetype)randomItem
{
    NSString *itemName = [NSString stringWithFormat:@"%c%c%c", 'A' + arc4random() % 26, 'A' + arc4random() % 26, 'A' + arc4random() % 26];
    NSString *itemSerial = [NSString stringWithFormat:@"%c%c", '0' + arc4random() % 10, '0' + arc4random() % 10];
    int valueInDollar = arc4random() % 100;
    return [[BNRItem alloc]initWithName:itemName serial:itemSerial valueInDollar:valueInDollar];
}
@end
