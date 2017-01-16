//
//  GameController.m
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerArray = [NSMutableArray new];
        _playerIndex = 0;
        for (int i = 1; i < 3; i++) {
            [self.playerArray addObject:[[Player alloc] initWithName: [NSString stringWithFormat:@"Player%i", i]]];
            _playerAnswer = @"";
        }
    }
    return self;
}

- (NSString*) generateQuestion {
    self.number1 = arc4random_uniform(21)+10;
    self.number2 = arc4random_uniform(21)+10;
    return [NSString stringWithFormat:@"%@\nWhat is %lu + %lu?", self.playerArray[self.playerIndex].name, self.number1, self.number2];
}

- (NSString *) acceptAnswer: (NSInteger) tag {
    self.playerAnswer = [NSString stringWithFormat:@"%@%ld", self.playerAnswer, tag];
    return self.playerAnswer;
}

- (BOOL) checkMath {
    if ([self.playerAnswer intValue] == (self.number1+self.number2)) {
        return YES;
    }
    else {
        self.playerArray[self.playerIndex].lives --;
        return NO;
    }
}

- (NSString *) answerRight {
    return [NSString stringWithFormat:@"Player%ld you are correct!\n%ld + %ld = %ld", self.playerIndex+1, self.number1, self.number2, self.number1+self.number2];
}

- (NSString *) answerWrong {
    return [NSString stringWithFormat:@"Player%ld you are wrong!\n%ld + %ld = %ld", self.playerIndex+1, self.number1, self.number2, self.number1+self.number2];
}

- (NSString *) newQuestion {
    self.number1 = arc4random_uniform(21)+10;
    self.number2 = arc4random_uniform(21)+10;
    self.playerAnswer = @"";
    if (self.playerIndex == 0) {
        self.playerIndex ++;
    }
    else {
        self.playerIndex = 0;
    }
    return [NSString stringWithFormat:@"%@\nWhat is %lu + %lu?", self.playerArray[self.playerIndex].name, self.number1, self.number2];
}

- (NSString *)checkPlayerLives {
    return [NSString stringWithFormat:@"%ld", self.playerArray[self.playerIndex].lives];
}

- (BOOL) gameOver {
    for (Player *player in self.playerArray) {
        if (player.lives == 0) {
            if (self.playerIndex == 0) {
                self.playerIndex ++;
            }
            else {
                self.playerIndex = 0;
            }
            return YES;
        }
    }
    return NO;
}
@end
