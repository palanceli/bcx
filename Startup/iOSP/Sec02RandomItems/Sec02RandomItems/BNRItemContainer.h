//
//  BNRItemContainer.h
//  Sec02RandomItems
//
//  Created by libei on 15/7/31.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRItemContainer : BNRItem
{
    NSMutableArray *subitems;
}
-(NSString*)description;
-(int)valueInDollar;
-(int)selfValueInDollar;
-(void)addItem:(BNRItem*)item;
-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)serialNumber valueInDollar:(int)value;
@end
