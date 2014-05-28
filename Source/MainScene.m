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
 if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad){ self.scale = 1.07;}
  
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"SeePre"]) {
        FirstTimeIntroLayer * first = (FirstTimeIntroLayer *) [CCBReader load:@"FirstTimeIntroLayer"];
        first.delegate = self;
        _mainScrollView.contentNode = first;
    }else{
    SkipIntoLayer * skip = (SkipIntoLayer *)[CCBReader load:@"SkipIntoLayer"];
    skip.delegate = self;
    _mainScrollView.contentNode = skip;
    }
}
-(void) firstTimeEnd
{
    FirstTimeIntroTwoLayer * two = (FirstTimeIntroTwoLayer *) [CCBReader load:@"FirstTimeIntroTwoLayer"];
    two.delegate = self;
    _mainScrollView.contentNode = two;

}
-(void) firstTimeIntro //left FirstTimeIntro into LeagueScene
{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"SeePre"] ){
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"SeePre"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[CCDirector sharedDirector]popScene];
    }else{
    MainMenuLayer * menu = (MainMenuLayer *) [CCBReader load:@"MainMenuLayer"];
    menu.delegate = self;
    _mainScrollView.contentNode = menu;
    CCLOG(@"skip!!!!");
    [self pushLeagueScene];
    }
}
-(void) selectFirstTime // from button into FirstIntro
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SeePre"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    MainScene * main = (MainScene *)[CCBReader loadAsScene:@"MainScene"];

    [[CCDirector sharedDirector] pushScene:main];
   /* FirstTimeIntroLayer * first = (FirstTimeIntroLayer *) [CCBReader load:@"FirstTimeIntroLayer"];
    first.delegate = main;
    main.mainScrollView.contentNode = first;*/
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
