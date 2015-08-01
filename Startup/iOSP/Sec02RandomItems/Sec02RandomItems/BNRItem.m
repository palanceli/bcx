//
//  BNRItem.m
//  Sec02RandomItems
//
//  Created by palance on 15/7/30.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(void) setItemName:(NSString *)str
{
    _itemName = str;
}

-(NSString*)itemName
{
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

-(NSString*)serialNumber
{
    return _serialNumber;
}

-(void) setValueInDollar:(int)value
{
    _valueInDollar = value;
}

-(int)valueInDollar
{
    return _valueInDollar;
}

-(NSDate*)dateCreated
{
    return _dateCreated;
}

-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)serialNumber valueInDollar:(int)value
{
    self = [super init];
    if(self){
        _itemName = name;
        _serialNumber = serialNumber;
        _valueInDollar = value;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return[self initWithItemName:name serialNumber:@"" valueInDollar:0];
}

-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString*)serialNumber
{
    return [self initWithItemName:name serialNumber:serialNumber valueInDollar:0];
}

-(instancetype)init
{
    return[self initWithItemName:@"Item" serialNumber:@"" valueInDollar:0];
}


-(NSString*)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@(%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollar, self.dateCreated];
    return descriptionString;
}


+(instancetype)randomItem
{
    NSArray *nameArray = @[@"item1", @"item2", @"item3"];
    NSArray *adjArray = @[@"good", @"better", @"best"];
    NSInteger nName = arc4random() % [nameArray count];
    NSInteger nAdj = arc4random() % [adjArray count];
    
    NSString *name = [NSString stringWithFormat:@"%@-%@", nameArray[nName], adjArray[nAdj]];
    
    NSString *serialNumber = [NSString stringWithFormat:@"%c-%c-%c-%c", '0' + arc4random() % 10, 'A' + arc4random() % 24, '0' + arc4random() % 10, 'A' + arc4random() % 26];
    
    int valueInDollar = arc4random() % 100;
    
    BNRItem *item = [[BNRItem alloc]initWithItemName:name serialNumber:serialNumber valueInDollar:valueInDollar];
    return item;
}

-(void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}
@end
