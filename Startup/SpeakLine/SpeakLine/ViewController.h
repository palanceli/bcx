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
    NSSpeechSynthesizer *_speechSynth;
}
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)StopIt:(id)sender;
- (IBAction)SpeakIt:(id)sender;

@end

