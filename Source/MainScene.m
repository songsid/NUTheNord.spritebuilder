//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
-(void) didLoadFromCCB
{
    //self.userInteractionEnabled = TRUE;
    
    SkipIntoLayer * skip = (SkipIntoLayer *)[CCBReader load:@"SkipIntoLayer"];
    skip.delegate = self;
    _mainScrollView.contentNode = skip;
    
    
}

-(void) skipInto
{
    MainMenuLayer * menu = (MainMenuLayer *) [CCBReader load:@"MainMenuLayer"];
    menu.delegate = self;
    _mainScrollView.contentNode = menu;
    CCLOG(@"skip!!!!");
    
    
}
-(void) pushPlayerInfoScene
{
    CCScene * info = (CCScene * )[CCBReader loadAsScene:@"PlayerInfoScene"];
    CCTransition *trans = [CCTransition transitionPushWithDirection:1 duration:0.2f];
    [[CCDirector sharedDirector]pushScene:info withTransition:trans];
}

-(void) pushLeagueScene
{
}
@end
