//
//  ViewController.h
//  SpeakLine
//
//  Created by palance on 15/7/16.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    NSSpeechSynthesizer* _speechSynth;
}

- (IBAction)StopIt:(id)sender;
- (IBAction)SayIt:(id)sender;
@property (weak) IBOutlet NSTextField *textField;

@end

