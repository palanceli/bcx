//
//  ViewController.h
//  Sec06-2SpeakLine
//
//  Created by palance on 15/7/23.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSSpeechSynthesizerDelegate>{
    NSArray *_voices;
    NSSpeechSynthesizer *_speechSynth;
}

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSButton *startButton;

- (IBAction)sayIt:(id)sender;
- (IBAction)stopIt:(id)sender;
@end

