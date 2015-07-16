//
//  ViewController.h
//  CountChar
//
//  Created by palance on 15/7/16.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *summary;

- (IBAction)countCharacters:(id)sender;
@end

