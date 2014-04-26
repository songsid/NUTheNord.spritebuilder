//
//  Dialog.m
//  NUTheNord
//
//  Created by Sid on 2014/4/22.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "Dialog.h"
#import "LeagueScene.h"
@implementation Dialog
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = YES;
    userActInt = YES;
    
    _dialogtext.string = [NSString stringWithFormat:@"歡迎來到新手教學"];
    dialogInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"DialogInt"];

}



-(void) update:(CCTime)delta
{
    //set delay time for dialog remove
    if (!userActInt) {
        CCLOG(@"!userActInt");
        if (!self.userInteractionEnabled) {
            userActInt = YES;
            CCLOG(@"!userInteractionEnabled");
            [self scheduleBlock:^(CCTimer *timer) {
                self.userInteractionEnabled = YES;
                    dialogInt = dialogInt + 1;
                CCLOG(@"YYYYYYYEEEEEEEESSSSSSS");
            } delay:0.0f];
        }
    }
    
    switch (dialogInt) {
        case 0:
        {

            _dialogtext.string = [NSString stringWithFormat:@"這裡是基地內的戰鬥實驗室\n接下來我會教你如何使用英靈戰鬥"];
            break;
        }
        case 1:
        {
            _dialogtext.string = [NSString stringWithFormat:@"觸碰遊戲空白處可以跳躍"];
            break;
        }
        case 2:
        {
            _dialogtext.string = [NSString stringWithFormat:@"按下右下角的按鈕可以使用普通攻擊"];
            break;
        }
        case 3:
        {
            _dialogtext.string = [NSString stringWithFormat:@"按下中下方的按鈕可以使用技能攻擊"];
            break;
        }
        case 4:
        {
            _dialogtext.string = [NSString stringWithFormat:@"接下來自己試試看吧！"];
            break;
        }
        case 5:
        {
            [self.delegate removeDialog];
            
            break;
        }
        case 10:
        {
            _dialogtext.string = [NSString stringWithFormat:@"點擊遊戲空白處跳躍！"];
            self.userInteractionEnabled = NO;
            break;
        }
        case 11:
        {
            [self.delegate removeDialog];
            
            break;
        }
        case 12:
        {
            _dialogtext.string = [NSString stringWithFormat:@"攻擊！！"];
            self.userInteractionEnabled = NO;
            break;
        }
        case 13:
        {
            [self.delegate removeDialog];
            break;
        }
        case 14:
        {
            _dialogtext.string = [NSString stringWithFormat:@"小心！碰到火球會大量損耗HP\n點擊遊戲空白處跳躍閃避！！"];
            self.userInteractionEnabled = NO;
            break;
        }
        case 15:
        {
            [self.delegate removeDialog];
            break;
        }
        default:
            break;
    }
}
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{

    self.userInteractionEnabled = NO;
    userActInt = NO;
    CCLOG(@"touchend! +1");

}


@end
