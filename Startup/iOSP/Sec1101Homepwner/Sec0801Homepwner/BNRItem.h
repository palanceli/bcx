//
//  BNRItem.h
//  Sec0801Homepwner
//
//  Created by palance on 15/8/3.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property NSString *itemName;
@property NSString *itemSerial;
@property int valueInDollar;
@property NSDate *createdDate;

-(instancetype)init;
-(instancetype)initWithName:(NSString *)itemName serial:(NSString*)serial valueInDollar:(int)valueInDollar;
+(instancetype)randomItem;

@end
