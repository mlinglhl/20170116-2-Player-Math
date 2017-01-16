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
            self.playerEntry.text = @"";
    }
    else {
        self.playerEvaluation.backgroundColor = [UIColor redColor];
        self.playerEvaluation.text = [self.model answerWrong];
        self.playerEntry.text = @"";
        if (self.model.playerIndex == 0) {
            self.player1Lives.text = [self.model checkPlayerLives];
        }
        else {
            self.player2Lives.text = [self.model checkPlayerLives];
        }
    }
    if ([self.model gameOver]) {
        self.questionLabel.text = [NSString stringWithFormat:@"The game is over! Player%ld wins!", self.model.playerIndex+1];
    }
    else {
        self.questionLabel.text = [self.model newQuestion];
    }
}
@end
