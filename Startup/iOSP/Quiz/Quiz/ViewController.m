//
//  ViewController.m
//  Quiz
//
//  Created by palance on 15/7/25.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    self.currentQuestionIndex++;
    
    if(self.currentQuestionIndex == [self.questions count]){
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}

- (void) awakeFromNib
{
    self.questions = @[@"From what is cognac made?",
                       @"What is 7+7?",
                       @"What is the captial of Vermont?"];
    self.answers = @[@"Grapes",
                     @"14",
                     @"Montpelier"];
    
}

@end
