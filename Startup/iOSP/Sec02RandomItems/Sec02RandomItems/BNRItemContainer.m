//
//  BNRItemContainer.m
//  Sec02RandomItems
//
//  Created by libei on 15/7/31.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItemContainer.h"

@implementation BNRItemContainer
-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)serialNumber valueInDollar:(int)value
{
    self = [super initWithItemName:name serialNumber:serialNumber valueInDollar:value];
    if(self){
        subitems = [[NSMutableArray alloc]init];
    }
    return self;
}
-(int)valueInDollar
{
    int value = 0;
    for (BNRItem *item in subitems) {
        value += [item valueInDollar];
    }
    value += [self selfValueInDollar];
    return value;
}

-(int)selfValueInDollar
{
    return _valueInDollar;
}

-(void)addItem:(BNRItem *)item
{
    [subitems addObject:item];
}

-(NSString*)description
{
    NSString *result = [[NSString alloc]initWithFormat:@"%@:Worth $%d", self.itemName, self.valueInDollar];
    for (BNRItem* item in subitems) {
        NSString *str = [[NSString alloc]initWithFormat:@"%@\n  %@", result, item];
        result = str;
    }
    return result;
}
@end
