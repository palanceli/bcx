//
//  ViewController.h
//  Sec05SpeakLine
//
//  Created by palance on 15/7/21.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSSpeechSynthesizerDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
}
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *speakButton;
@property (weak) IBOutlet NSButton *stopButton;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;
@end

