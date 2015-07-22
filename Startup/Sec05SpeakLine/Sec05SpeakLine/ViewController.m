//
//  ViewController.m
//  Sec05SpeakLine
//
//  Created by palance on 15/7/21.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize textField = _textField;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (void)awakeFromNib
{
    // 创建NSSpeechSynthesizer的一个新实例，该实例使用默认声音
    _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}


- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    
    // 字符串长度为0吗？
    if([string length] == 0){
        NSLog(@"string from %@ is of zero-lenght", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}
@end
