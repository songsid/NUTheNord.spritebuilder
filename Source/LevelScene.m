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
    Level_1 * level = (Level_1 *) [CCBReader load:@"Level_1"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
}
-(void) sendLevel:(CCNode *)level
{
    _levelSceneScrollView.contentNode = level;
        CCLOG(@"pass level_0!!!!!!!");
}

-(void) popLevelScene
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:1.0f];
    [[CCDirector sharedDirector ]popSceneWithTransition:trans];
}

-(void) isAttack:(id)sender
{

    Level_1 * level1 = (Level_1 *) self.currentLevel;

    [level1 attack];
    
    CCLOG(@"attack");
}
@end
