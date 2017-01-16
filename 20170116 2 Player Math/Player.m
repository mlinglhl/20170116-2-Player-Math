//
//  Player.m
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        _name = name;
        _lives = 3;
    }
    return self;
}

@end
