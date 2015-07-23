//
//  ViewController.m
//  Sec06-2SpeakLine
//
//  Created by palance on 15/7/23.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize textField = _textField;
@synthesize stopButton = _stopButton;
@synthesize startButton = _startButton;
@synthesize tableView = _tableView;

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
    _speechSynth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
    [_speechSynth setDelegate:self];
    _voices = [NSSpeechSynthesizer availableVoices];
    
    // 当表格视图出现在屏幕上时，选择默认的声音
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [_voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView*)tv
{
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView*)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification*)notification
{
    NSInteger row = [_tableView selectedRow];
    if(row == -1){
        return;
    }
    NSString *selectedVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@", selectedVoice);
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    if([string length] == 0){
        return;
    }
    
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
    [_stopButton setEnabled:YES];
    [_startButton setEnabled:NO];
    [_tableView setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"complete = %d", finishedSpeaking);
    [_stopButton setEnabled:NO];
    [_startButton setEnabled:YES];
    [_tableView setEnabled:YES];
}

@end
