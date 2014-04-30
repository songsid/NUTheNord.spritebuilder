//
//  LevelScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LevelScene.h"

@implementation LevelScene

-(void) didLoadFromCCB
{
    
    _levelSceneScrollView.anchorPoint = ccp(0,0);
    _levelSceneScrollView.position = ccp(0, 0);
    _levelSceneScrollView.verticalScrollEnabled= NO;
    _levelSceneScrollView.horizontalScrollEnabled = NO;
    _levelSceneScrollView.bounces = NO;
    _levelSceneScrollView.pagingEnabled = NO;
    _levelSceneScrollView.userInteractionEnabled = NO;
    self.userInteractionEnabled = TRUE;
    int switchLevel = [[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"];
        switch (switchLevel) {
        case 0:
                [self switchLevel_0First];
            break;
        case 1:
                [self switchLevel_1];
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
        }

    _entered = YES;
    
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            _skillOne.visible = NO;
            _skillTwo.visible = NO;
            break;
        case 1:
            _skillOne.visible = YES;
            _skillTwo.visible = NO;
            break;
        case 2:
            _skillOne.visible = NO;
            _skillTwo.visible = YES;
            break;
            
        default:
            break;
    }
    info = (HPMPInfo *)[CCBReader load:@"HPMPInfo"];
    info.anchorPoint = ccp(0,0);
    info.position = ccp(7.0f, 266.0f);
    self.HPMP = info;
    [self addChild:info];
}

-(void) update:(CCTime)delta
{
  
    count = count +delta*100;
    if (count%5 ==0) {
        CCLOG(@"levelSceneScrollView.paused = %hhd",_levelSceneScrollView.paused);
    }
}
-(void) switchLevel_0First
{
    Level_0First * level = (Level_0First *)[CCBReader load:@"Level_0lab"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
}
-(void) switchLevel_1
{
    Level_1 * level = (Level_1 *)[CCBReader load:@"Level_1"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
}
-(void) sendLevel:(CCNode *)level
{
    
        _levelSceneScrollView.contentNode = level;
        CCLOG(@"get send Level : %@",level);
}

-(void) popLevelScene
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:1.0f];
    [[CCDirector sharedDirector ]popSceneWithTransition:trans];
    [[OALSimpleAudio sharedInstance] stopAllEffects];
}



-(void) isAttack:(id)sender
{
    if([[NSString stringWithFormat:@"%@",_currentLevel.class]isEqualToString:@"Level_0First"])
    {
        CCLOG(@"is Equal to Level_0First");
    }
    if (info.MP>=1) {
    Level_0First * level = (Level_0First *) self.currentLevel;

    [level attack];
        
    }
    CCLOG(@"attack %@",_currentLevel.class);
}
-(void) transHpDecrease :(int) damage
{
    [info hpDecrease:damage];
}
-(void) transHpIncrease :(int) plus{}
-(void) transMpDecrease :(int) mpcount
{
    [info mpDecrease:mpcount];
}
-(void) transMpIncrease :(int) destance
{
    [info mpIncrease:destance];
}

-(int) getHp
{
    return info.HP;
}
-(int) getMp
{
    return info.MP;
}
-(void) touchToPaused:(BOOL)ny
{

    if (_levelSceneScrollView.paused ==NO && !ny) {
        _attack.enabled = NO;
        _skillOne.enabled =NO;
        _skillTwo.enabled = NO;
   _levelSceneScrollView.paused = !_levelSceneScrollView.paused;
                [self loadDialog];
        CCLOG(@"touchpause");
    }else
        if(_levelSceneScrollView.paused ==NO && ny){
            [self scheduleBlock:^(CCTimer *timer) {
                _attack.enabled = YES;
                _skillOne.enabled =YES;
                _skillTwo.enabled = YES;
            } delay:0.3f];

        self.currentLevel.userInteractionEnabled = NO;
        _levelSceneScrollView.paused = !_levelSceneScrollView.paused;
        [self loadDialog];
    
    }
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
    int dia = [[NSUserDefaults standardUserDefaults] integerForKey:@"DialogInt"];
    [diag removeFromParentAndCleanup:YES];
    _levelSceneScrollView.paused = NO;
    
    if (dia>=14) {
        [self scheduleBlock:^(CCTimer *timer) {
            _attack.enabled = YES;
            _skillOne.enabled =YES;
            _skillTwo.enabled = YES;
        } delay:0.3f];

    }else
    {
        _attack.enabled = NO;
        _skillOne.enabled =NO;
        _skillTwo.enabled = NO;
    }
    CCLOG(@"removeFromParent!");
}
-(BOOL) getPaused
{
    return _levelSceneScrollView.paused;
}
@end
