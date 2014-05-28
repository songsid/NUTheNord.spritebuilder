//
//  MainMenuLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer
-(void)didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
  //  [[OALSimpleAudio sharedInstance] playEffect:@"main4.mp3" loop:YES];

}

-(void) isPlayerInfoScene:(id) sender
{
    [self.delegate pushPlayerInfoScene];
        [[OALSimpleAudio sharedInstance] playEffect:@"sure4.mp3"];
}
-(void) isFirstTimeIntro:(id)sender
{
    [self.delegate selectFirstTime];
}
-(void) isLeagueScene:(id)sender
{
    [self.delegate pushLeagueScene];
        [[OALSimpleAudio sharedInstance] playEffect:@"sure4.mp3"];
}
@end
