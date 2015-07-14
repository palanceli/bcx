//
//  LotteryEntry.h
//  lottery
//
//  Created by palance on 15/7/13.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LotteryEntry : NSObject{
    NSDate* entryDate;
    int firstNumber;
    int secondNumber;
}

-(id)initWithEntryDate:(NSDate*)theDate;
-(void)setEntryDate:(NSDate*)date;
-(NSDate*)entryDate;
-(int)firstNumber;
-(int)secondNumber;
-(void)dealloc;
@end
