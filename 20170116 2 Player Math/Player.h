//
//  Player.h
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSString *name;
@property NSInteger lives;
- (instancetype)initWithName: (NSString *) name;
@end
