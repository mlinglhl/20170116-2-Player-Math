//
//  ViewController.h
//  20170116 2 Player Math
//
//  Created by Minhung Ling on 2017-01-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *playerEntry;
@property GameController *model;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerEvaluation;
@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;
- (IBAction)pushButton:(UIButton *)sender;
- (IBAction)pushEnter:(UIButton *)sender;
@end

