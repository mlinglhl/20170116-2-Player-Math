//
//  GameController.h
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property NSMutableArray <Player *> *playerArray;
@property NSInteger number1;
@property NSInteger number2;
@property NSString *playerAnswer;
@property NSInteger playerIndex;
- (NSString*) generateQuestion;
- (NSString *) acceptAnswer: (NSInteger) tag;
- (BOOL) checkMath;
- (NSString *) newQuestion;
- (NSString *) checkPlayerLives;
- (NSString *) answerRight;
- (NSString *) answerWrong;
- (BOOL) gameOver;
@end
