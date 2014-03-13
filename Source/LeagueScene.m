//
//  LeagueScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LeagueScene.h"

@implementation LeagueScene
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    LeagueLayer * league = (LeagueLayer *) [CCBReader load:@"LeagueLayer"];
    league.delegate = self;
    _leagueSceneScrollView.contentNode = league;
}

-(void) popLeagueScene
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
    CCLOG(@"popleague!!!!!");
}
-(void) pushLevel :(CCNode *) level
{
    
    CCScene * scene = (CCScene * )[CCBReader loadAsScene:@"LevelScene"];
    CCTransition *trans = [CCTransition transitionPushWithDirection:1 duration:0.2f];
    [[CCDirector sharedDirector]pushScene:scene withTransition:trans];
    [self.delegate sendLevel:level];
        CCLOG(@"pass level_0!! ");
}
@end
