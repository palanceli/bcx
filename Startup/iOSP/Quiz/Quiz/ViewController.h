//
//  ViewController.h
//  Quiz
//
//  Created by palance on 15/7/25.
//  Copyright (c) 2015年 binglen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end

