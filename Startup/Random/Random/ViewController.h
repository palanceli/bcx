//
//  ViewController.h
//  Random
//
//  Created by palance on 15/7/12.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController{
    IBOutlet NSTextField *textField;
}
- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;


@end

