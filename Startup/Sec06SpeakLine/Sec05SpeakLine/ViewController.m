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

-(id)init
{
    self = [super init];
    if(self){
        // 日志可帮助开发者理解程序运作，并可找出bug
        NSLog(@"init");
        
        // 创建NSSpeechSynthesizer的一个新实例，该实例使用默认声音
        _speechSynth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
        [_speechSynth setDelegate:self];
    }
    return self;
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
    
    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
    
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
}
@end
