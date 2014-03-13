//
//  PlayerInfoScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PlayerInfoScene.h"

@implementation PlayerInfoScene
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    PlayerInfoLayer * infoLayer = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
    infoLayer.delegate = self;
    _playerInfoScrollView.contentNode = infoLayer;
}
-(void) popPlayerInfo
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2f];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
}
@end
