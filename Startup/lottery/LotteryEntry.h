//
//  LotteryEntry.h
//  
//
//  Created by palance on 15/7/13.
//
//

#import <Foundation/Foundation.h>


@interface LotteryEntry : NSObject{
    NSDate* entryDate;
    int firstNumber;
    int secondNumber;
}

-(void)prepareRandomNumbers;
-(void)setEntryDate:(NSDate*)date;
-(NSDate*)entryDate;
-(int)firstNumber;
-(int)secondNumber;

@end
