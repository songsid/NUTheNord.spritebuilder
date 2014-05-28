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
    if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
 
        self.scale = 1.07;
    }

    self.userInteractionEnabled = TRUE;
    LeagueLayer * league = (LeagueLayer *) [CCBReader load:@"LeagueMapLayer"];
    league.delegate = self;
    _leagueSceneScrollView.contentNode = league;
    _cancel.zOrder = 100;
    _enter.zOrder = 100;
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
-(void) isPopLeagueScene:(id)sender
{
    if (showInfo) {
        showInfo = NO;
        [self removeChild:leagueInfo cleanup:YES];
    }else{
    [self popLeagueScene];
    }
}
-(void) showLeagueInfo:(CGPoint)x :(int)level
{
    levelCount = level;
    leagueInfo = (LeagueInfo *)[CCBReader load:@"LeagueInfo"];
    leagueInfo.position = x;
    leagueInfo.scale = 0.1f;
    [self addChild:leagueInfo z:0];
    id scale = [CCActionScaleTo actionWithDuration:0.2f scaleX:0.7f scaleY:0.7f];
    id mov = [CCActionMoveTo actionWithDuration:0.2f position:ccp(_leagueSceneScrollView.contentSize.width *0.5,_leagueSceneScrollView.contentSize.height *0.5 )];
    [leagueInfo runAction:scale];
    [leagueInfo runAction:mov];
    showInfo = YES;
    
}
-(void) isEnter:(id)sender
{
    if (leagueInfo.parent) {
        switch (levelCount) {
            case 0:
                [self appearAlertView];
                break;
            
            case 1:
                [self appearAlertView];
                break;
                
            default:
                break;
        }
    }
}
/////////
-(id) initWithTitle:(NSString*)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle{return 0;}
-(void) showAV{}
-(void) appearAlertView
{
    
    [self scheduleBlock:^(CCTimer *timer){
        CCAlertView *av = [[CCAlertView alloc] initWithTitle:@"  " message:@"是否進入關卡？" delegate:self cancelButtonTitle:@"否" otherButtonTitle:@"是"];
        [av showAV];
        
        CCLOG(@"self scheduleblock");
    } delay:0.0f];
    
}
//set the Ok and Cancel of CCAlertView
- (void) CCAlertView:(CCNode *)alertView indexSelected:(int)index {
    if (index == 0) {
        CCLOG(@"CANCEL Pressed");

        
        
    }else if (index == 1) {
        CCLOG(@"OK Pressed");
        
        [self pushLevel];
        
    }
}
////////
@end
