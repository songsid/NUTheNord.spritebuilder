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
@end
