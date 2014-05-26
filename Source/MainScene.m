//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Sid on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
-(void) didLoadFromCCB
{
    //self.userInteractionEnabled = TRUE;
    _mainScrollView.anchorPoint = ccp(0,0);
    _mainScrollView.position = ccp(0, 0);
    SkipIntoLayer * skip = (SkipIntoLayer *)[CCBReader load:@"SkipIntoLayer"];
    skip.delegate = self;
    _mainScrollView.contentNode = skip;
    
    [[NSUserDefaults standardUserDefaults] setObject:@"danchen" forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setInteger:99 forKey:@"score"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void) firstTimeIntro
{
    MainMenuLayer * menu = (MainMenuLayer *) [CCBReader load:@"MainMenuLayer"];
    menu.delegate = self;
    _mainScrollView.contentNode = menu;
    CCLOG(@"skip!!!!");
    
}
-(void) skipInto
{
    NSString *firstIntro = [[NSUserDefaults standardUserDefaults]objectForKey:@"FirstTime"];
    
    if (!firstIntro) {
        FirstTimeIntroLayer * first = (FirstTimeIntroLayer *) [CCBReader load:@"FirstTimeIntroLayer"];
        first.delegate = self;
        _mainScrollView.contentNode = first;
    }else{
    
    MainMenuLayer * menu = (MainMenuLayer *) [CCBReader load:@"MainMenuLayer"];
    menu.delegate = self;
    _mainScrollView.contentNode = menu;
    CCLOG(@"skip!!!!");
    }
    
}
-(void) pushPlayerInfoScene
{
    CCScene * info = (CCScene * )[CCBReader loadAsScene:@"PlayerInfoScene"];
    CCTransition *trans = [CCTransition transitionPushWithDirection:1 duration:0.2f];
    [[CCDirector sharedDirector]pushScene:info withTransition:trans];
}

-(void) pushLeagueScene
{
    CCScene * info = (CCScene * )[CCBReader loadAsScene:@"LeagueScene"];
    CCTransition *trans = [CCTransition transitionPushWithDirection:1 duration:0.2f];
    [[CCDirector sharedDirector]pushScene:info withTransition:trans];
    
}
@end
