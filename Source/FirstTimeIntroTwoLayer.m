//
//  FirstTimeIntroTwoLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/5/26.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "FirstTimeIntroTwoLayer.h"

@implementation FirstTimeIntroTwoLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled= YES;
    [[NSUserDefaults standardUserDefaults] setInteger:90 forKey:@"DialogInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
  //  [[OALSimpleAudio sharedInstance] stopAllEffects];
  //  [[OALSimpleAudio sharedInstance] playEffect:@"firstTimeMusic2.mp3" loop:YES];
    [self loadDialog];
}
-(void) loadDialog
{
    diag = (Dialog *)[CCBReader load:@"Dialog"];
    diag.anchorPoint = ccp(0,0);
    diag.position = ccp(0,120);
    diag.delegate = self;
    [self addChild:diag ];
    
}
-(void) removeDialog
{
    [diag removeFromParentAndCleanup:YES];
    [self.delegate firstTimeIntro];

}
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{}
-(void)onExit {
    [self stopAllActions];
    [self unscheduleAllSelectors];
    [self removeAllChildrenWithCleanup:YES];
  //  [[OALSimpleAudio sharedInstance] stopAllEffects];
  //  [[OALSimpleAudio sharedInstance]unloadAllEffects];
    CCLOG(@"Onexit");
    [super onExit];
}
@end
