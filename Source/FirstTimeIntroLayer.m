//
//  FirstTimeIntroLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/15.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "FirstTimeIntroLayer.h"

@implementation FirstTimeIntroLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = YES;
    //first time key
    [[NSUserDefaults standardUserDefaults] setObject:@"Intro"  forKey:@"FirstTime" ];
    //spirit default
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Spirit"];

    [[NSUserDefaults standardUserDefaults] synchronize];

    _talk.anchorPoint = ccp(0.5, 0.5);
    _talk.position = ccp(240, 160);

    _talk.string = [NSString stringWithFormat:@"你好"];
    labelCount = 0;

}

-(void) update:(CCTime)delta
{
    switch (labelCount) {
        case 1:
            _talk.string = [NSString stringWithFormat:@"1"];
            break;
        case 2:
            _talk.string = [NSString stringWithFormat:@"2"];
            break;
        case 3:
            _talk.string = [NSString stringWithFormat:@"3"];
            break;
        case 4:
            _talk.string = [NSString stringWithFormat:@"4"];
            break;
        case 5:
            _talk.string = [NSString stringWithFormat:@"5"];
            break;
        case 6:
            _talk.string = [NSString stringWithFormat:@"6"];
            break;
        case 7:
            _talk.string = [NSString stringWithFormat:@"7"];
            break;
        case 8:
            _talk.string = [NSString stringWithFormat:@"8"];
            break;
        case 9:
            _talk.string = [NSString stringWithFormat:@"9"];
            break;
        case 10:
            _talk.string = [NSString stringWithFormat:@"10"];
            break;
        case 11:
            _talk.string = [NSString stringWithFormat:@"11"];
            break;
        
        case 12:
            
            [self.delegate firstTimeIntro];
            
            break;
        default:
            break;
    }
    
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{

    labelCount = labelCount + 1;

}

@end
