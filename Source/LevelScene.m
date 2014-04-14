//
//  LevelScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LevelScene.h"

@implementation LevelScene
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    int switchLevel = [[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"];
        switch (switchLevel) {
        case 0:
                [self switchLevel_0First];
            break;
        case 1:
                [self switchLevel_1];
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
        }

    _entered = YES;
    
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            _skillOne.visible = NO;
            _skillTwo.visible = NO;
            break;
        case 1:
            _skillOne.visible = YES;
            _skillTwo.visible = NO;
            break;
        case 2:
            _skillOne.visible = NO;
            _skillTwo.visible = YES;
            break;
            
        default:
            break;
    }
    info = (HPMPInfo *)[CCBReader load:@"HPMPInfo"];
    info.anchorPoint = ccp(0,0);
    info.position = ccp(7.0f, 266.0f);
    self.HPMP = info;
    [self addChild:info];
}
-(void) switchLevel_0First
{
    Level_0First * level = (Level_0First *)[CCBReader load:@"Level_0First"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
}
-(void) switchLevel_1
{
    Level_1 * level = (Level_1 *)[CCBReader load:@"Level_1"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
}
-(void) sendLevel:(CCNode *)level
{
    
        _levelSceneScrollView.contentNode = level;
        CCLOG(@"get send Level : %@",level);
}

-(void) popLevelScene
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:1.0f];
    [[CCDirector sharedDirector ]popSceneWithTransition:trans];
}



-(void) isAttack:(id)sender
{
    if([[NSString stringWithFormat:@"%@",_currentLevel.class]isEqualToString:@"Level_0First"])
    {
        CCLOG(@"is Equal to Level_0First");
    }
    if (info.MP>=1) {
    Level_1 * level1 = (Level_1 *) self.currentLevel;

    [level1 attack];
        [self transMpDecrease:1];
    }
    CCLOG(@"attack %@",_currentLevel.class);
}
-(void) transHpDecrease :(int) damage
{
    [info hpDecrease:damage];
}
-(void) transHpIncrease :(int) plus{}
-(void) transMpDecrease :(int) count
{
    [info mpDecrease:1];
}
-(void) transMpIncrease :(int) destance
{
    [info mpIncrease:destance];
}

@end
