//
//  BNRItem.h
//  Sec02RandomItems
//
//  Created by palance on 15/7/30.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollar;
    NSDate  *_dateCreated;
}

-(void) setItemName:(NSString*)str;
-(NSString*)itemName;

-(void) setSerialNumber:(NSString*)str;
-(NSString*)serialNumber;

-(void) setValueInDollar:(int)value;
-(int)valueInDollar;

-(NSDate*) dateCreated;

-(instancetype)initWithItemName:(NSString*)name
                   serialNumber:(NSString*)serialNumber
                  valueInDollar:(int)value;
-(instancetype)initWithItemName:(NSString*)name;
-(instancetype)init;

-(NSString*)description;

+(instancetype)randomItem;

@end
