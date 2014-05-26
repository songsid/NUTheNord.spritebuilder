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
    _leagueSceneScrollView.anchorPoint = ccp(0, 0);
    _leagueSceneScrollView.position = ccp(0, 0);
    self.userInteractionEnabled = TRUE;
    LeagueLayer * league = (LeagueLayer *) [CCBReader load:@"LeagueMapLayer"];
    league.delegate = self;
    _leagueSceneScrollView.contentNode = league;
    
    //
    
    
}

-(void) popLeagueScene
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
    CCLOG(@"popleague!!!!!");
}
-(void) pushLevel
{
        CCScene * scene = (CCScene * )[CCBReader loadAsScene:@"LevelScene"];
        CCTransition *trans = [CCTransition transitionPushWithDirection:1 duration:0.2f];
        [[CCDirector sharedDirector]pushScene:scene withTransition:trans];
        [[OALSimpleAudio sharedInstance] stopAllEffects];
}
-(void) intoLevelOrNot
{
    
}

-(void) controlSlide:(int)slide
{
    
    
    if (slide%2) {
        [self.userObject runAnimationsForSequenceNamed:@"Slide"];
    }else{
        [self.userObject runAnimationsForSequenceNamed:@"BackSlide"];
    }
}
/////////
-(id) initWithTitle:(NSString*)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle{return 0;}
-(void) showAV{}
-(void) CCAlertView:(CCNode *)alertView indexSelected:(int)index{}
////////
@end
