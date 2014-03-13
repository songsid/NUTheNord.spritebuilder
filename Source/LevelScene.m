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
    Level_0 * level = (Level_0 *) [CCBReader load:@"Level_0"];
    _levelSceneScrollView.contentNode = level;
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
@end
