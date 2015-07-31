//
//  BNRItemContainer.m
//  Sec02RandomItems
//
//  Created by libei on 15/7/31.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "BNRItemContainer.h"

@implementation BNRItemContainer
-(int)valueInDollar
{
    int value = 0;
    for (BNRItem *item in subitems) {
        value += [item valueInDollar];
    }
    return value;
}

-(int)selfValueInDollar
{
    return _valueInDollar;
}

-(NSString*)description
{
    NSString *str = [NSString ];
    
}
@end
