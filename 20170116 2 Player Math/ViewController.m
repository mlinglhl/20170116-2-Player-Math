//
//  ViewController.m
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionLabel.text = [self.model generateQuestion];
    // Do any additional setup after loading the view, typically from a nib.
    self.resetButton.hidden = YES;
    self.playerEvaluation.alpha = 0;
    self.firework.alpha = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _model = [GameController new];
    }
    return self;
}


- (IBAction)pushButton:(UIButton *)sender {
    self.playerEntry.text = [self.model acceptAnswer:sender.tag];
}

- (IBAction)pushEnter:(UIButton *)sender {
    if ([self.model checkMath]) {
        self.playerEvaluation.backgroundColor = [UIColor greenColor];
        self.playerEvaluation.text = [self.model answerRight];
    }
    else {
        self.playerEvaluation.backgroundColor = [UIColor redColor];
        self.playerEvaluation.text = [self.model answerWrong];
        if (self.model.playerIndex == 0) {
            self.player1Lives.text = [self.model checkPlayerLives];
        }
        else {
            self.player2Lives.text = [self.model checkPlayerLives];
        }
    }
    
    [UIView animateWithDuration:2 animations:^{
        self.playerEvaluation.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            self.playerEvaluation.alpha = 0;
        }];
    }];
    
    self.playerEntry.text = @"";
    if ([self.model gameOver]) {
        self.resetButton.hidden = NO;
        [self.resetButton setTitle:[NSString stringWithFormat:@"The game is over! Player%ld wins! Click to reset.", self.model.playerIndex+1]
                          forState:UIControlStateNormal];
        [UIView animateWithDuration:3 animations:^{
            self.firework.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                self.firework.alpha = 0;
            }];
        }];
    }
    else {
        self.questionLabel.text = [self.model generateQuestion];
    }
}

- (IBAction)resetGame:(UIButton *)sender {
    self.resetButton.hidden = YES;
    self.player1Lives.text = [NSString stringWithFormat:@"%i", 3];
    self.player2Lives.text = [NSString stringWithFormat: @"%i", 3];
    self.playerEvaluation.text = @"";
    self.playerEvaluation.alpha = 0;
    [self.model resetGame];
    self.questionLabel.text = [self.model generateQuestion];
}
@end
