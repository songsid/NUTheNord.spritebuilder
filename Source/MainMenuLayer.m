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
    _blockButton.visible = NO;
    _blockButton.zOrder = 10;
    self.userInteractionEnabled = TRUE;
 //   [[OALSimpleAudio sharedInstance] stopAllEffects];
 //   [[OALSimpleAudio sharedInstance] playEffect:@"d5.mp3" loop:YES];


}

-(void) isPlayerInfoScene:(id) sender
{
    _blockButton.visible = YES;
    [self.delegate pushPlayerInfoScene];
    
    [self scheduleBlock:^(CCTimer *timer) {
        _blockButton.visible = NO;
    } delay:0.2f];
    
}
-(void) isFirstTimeIntro:(id)sender
{
    _blockButton.visible = YES;
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"SeePre"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self.delegate selectFirstTime];
    [self scheduleBlock:^(CCTimer *timer) {
        _blockButton.visible = NO;
    } delay:0.2f];
}
-(void) isLeagueScene:(id)sender
{
    _blockButton.visible = YES;
    [self.delegate pushLeagueScene];
    [self scheduleBlock:^(CCTimer *timer) {
        _blockButton.visible = NO;
    } delay:0.2f];
}
-(void) block:(id)sender
{
}


@end
