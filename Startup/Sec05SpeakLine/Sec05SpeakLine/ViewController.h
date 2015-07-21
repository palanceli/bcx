//
//  ViewController.h
//  Sec05SpeakLine
//
//  Created by palance on 15/7/21.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    NSSpeechSynthesizer *_speechSynth;
}
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;
@end

