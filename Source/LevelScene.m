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
                [_mcBG1_1 removeFromParentAndCleanup:YES];
                [_mcBG1_2 removeFromParentAndCleanup:YES];
                [_mcBG2_1 removeFromParentAndCleanup:YES];
                [_mcBG2_2 removeFromParentAndCleanup:YES];
                [_mcBG3_1 removeFromParentAndCleanup:YES];
                [_mcBG3_2 removeFromParentAndCleanup:YES];
                [_mcBG4_1 removeFromParentAndCleanup:YES];
                [_mcBG4_2 removeFromParentAndCleanup:YES];
                break;
        case 1:
                [self switchLevel_1MC];
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
            _skillOne.visible = YES;
            _skillTwo.visible = NO;
            break;
        case 1:
            _skillOne.visible = YES;
            _skillTwo.visible = NO;
            break;
        case 2:
            _skillOne.visible = YES;
            _skillTwo.visible = NO;
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
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"]== 1) {
       
        float levelAnchorPoint = (float)levelMc.getSelfAnchorPosition;
        if (!self.currentLevel.paused && (!levelMc.getDeltaStop||!levelMcBoss.getDeltaStop)) {
            
            _mcBG4_1.position = ccp(_mcBG4_1.position.x - delta * 10, _mcBG4_1.position.y);
            _mcBG4_2.position = ccp(_mcBG4_2.position.x - delta * 10, _mcBG4_2.position.y);
            
            _mcBG3_1.position = ccp(_mcBG3_1.position.x - delta * 15, _mcBG3_1.position.y);
            _mcBG3_2.position = ccp(_mcBG3_2.position.x - delta * 15, _mcBG3_2.position.y);
            
            
            _mcBG2_1.position = ccp(_mcBG2_1.position.x - delta * 30, _mcBG2_1.position.y);
            _mcBG2_2.position = ccp(_mcBG2_2.position.x - delta * 30, _mcBG2_2.position.y);
       
            _mcBG1_1.position = ccp(_mcBG1_1.position.x -delta *100, _mcBG1_1.position.y);
            _mcBG1_2.position = ccp(_mcBG1_2.position.x -delta *100, _mcBG1_2.position.y);
            if (_mcBG2_1.position.x < -678) {
                _mcBG2_1.position = ccp(_mcBG2_2.position.x +678, _mcBG2_1.position.y);
            }
            if (_mcBG2_2.position.x < -678) {
                _mcBG2_2.position = ccp(_mcBG2_1.position.x +678, _mcBG2_2.position.y);
            }
            if (_mcBG1_1.position.x< -678) {
                _mcBG1_1.position = ccp(_mcBG1_2.position.x +678, _mcBG1_1.position.y);
            }
            if (_mcBG1_2.position.x< -678) {
                _mcBG1_2.position = ccp(_mcBG1_1.position.x +678, _mcBG1_2.position.y);
            }
            if (_mcBG3_1.position.x< -678) {
                _mcBG3_1.position = ccp(_mcBG3_2.position.x +678, _mcBG3_1.position.y);
            }
            if (_mcBG3_2.position.x< -678) {
                _mcBG3_2.position = ccp(_mcBG3_1.position.x +678, _mcBG3_2.position.y);
            }
            if (_mcBG4_1.position.x< -678) {
                _mcBG4_1.position = ccp(_mcBG4_2.position.x +673, _mcBG4_1.position.y);
            }
            if (_mcBG4_2.position.x< -678) {
                _mcBG4_2.position = ccp(_mcBG4_1.position.x +673, _mcBG4_2.position.y);
            }
        }else if(self.currentLevel.paused)
                {
                    //[self.userObject ;
                }
    }
    CCLOG(@"mcbg2 = %f %f \n bg1 = %f %f",_mcBG2_1.position.x,_mcBG2_2.position.x,_mcBG1_1.position.x,_mcBG1_2.position.x);
}
-(void) switchLevel_0First
{
    Level_0First * level = (Level_0First *)[CCBReader load:@"Level_0lab"];
    _levelSceneScrollView.contentNode = level;
    CCLOG(@"_levelScemeScrollView.p & an = \n(%f,%f)\n (%f,%f)",_levelSceneScrollView.contentNode.position.x,_levelSceneScrollView.contentNode.position.y,_levelSceneScrollView.contentNode.anchorPoint.x,_levelSceneScrollView.contentNode.anchorPoint.y);
  //  _levelSceneScrollView.contentNode.position = ccp(0, 0);
 //   _levelSceneScrollView.contentNode.anchorPoint = ccp(0, 0);
    self.currentLevel = level;
    level.delegate = self;
}
-(void) switchLevel_1MC
{
//    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//    spinner.hidesWhenStopped = YES;
//    [[[CCDirector sharedDirector] view] addSubview:spinner];
//    [spinner startAnimating];
//    dispatch_queue_t sendDeviceTokenQueue = dispatch_queue_create("Load Level", NULL);
//    dispatch_async(sendDeviceTokenQueue, ^{
        Level_1MCBoss * level = (Level_1MCBoss *)[CCBReader load:@"Level_1MCBoss"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [spinner stopAnimating];
//            [spinner removeFromSuperview];
            _levelSceneScrollView.contentNode = level;
            self.currentLevel = level;
            level.delegate = self;
//        });
//    });

    
    /*
    Level_1MC * level = (Level_1MC *)[CCBReader load:@"Level_1MC"];
    _levelSceneScrollView.contentNode = level;
    self.currentLevel = level;
    level.delegate = self;
     */
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
    [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}



-(void) isAttack:(id)sender
{
    if([[NSString stringWithFormat:@"%@",_currentLevel.class]isEqualToString:@"Level_0First"])
    {
        if (info.MP>=1) {
        Level_0First * level = (Level_0First *) self.currentLevel;
        
        [level attack];
        }
        CCLOG(@"is Equal to Level_0First");
    }
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"]== 1) {
        if (info.MP>=1) {
            levelMc = (Level_1MC *) self.currentLevel;
            [levelMc attack];
        }
    }

}
-(void) isSkillOne :(id)sender
{
    if([[NSString stringWithFormat:@"%@",_currentLevel.class]isEqualToString:@"Level_0First"])
    {
        if (info.MP>=9) {
            Level_0First * level = (Level_0First *) self.currentLevel;
            [level skill];
        }
    }
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"]== 1) {
        if (info.MP>=9) {
            levelMc = (Level_1MC *) self.currentLevel;
            [levelMc skill];
        }
    }
}
-(void) scrollViewShake
{
    [self.userObject runAnimationsForSequenceNamed:@"shake"];
    
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
    CCLOG(@"_levelScemeScrollView.p & an = \n(%f,%f)\n (%f,%f)",_levelSceneScrollView.contentNode.position.x,_levelSceneScrollView.contentNode.position.y,_levelSceneScrollView.contentNode.anchorPoint.x,_levelSceneScrollView.contentNode.anchorPoint.y);

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
-(void) showClearCount
{
    
    _attack.enabled = NO;
    _skillOne.enabled =NO;
    _skillTwo.enabled = NO;
    
    
    clearCo = (ClearCount *)[CCBReader load:@"clearCount"];
    clearCo.anchorPoint = ccp(0, 0);
    clearCo.position = ccp(0, 0);
    clearCo.delegate = self;
    [self addChild:clearCo z:100];
}
-(BOOL) getPaused
{
    return _levelSceneScrollView.paused;
}
-(void) isPaused:(id)sender
{
    self.currentLevel.paused = YES;
    self.currentLevel.userInteractionEnabled = NO;
    _attack.enabled = NO;
    _skillOne.enabled =NO;
    _skillTwo.enabled = NO;
    _pausedButton.enabled = NO;
    pausedS = (PauseSetting *)[CCBReader load:@"PauseSetting"];
    pausedS.delegate = self;
    pausedS.anchorPoint = ccp(0.5, 0.5);
    pausedS.position = ccp(_levelSceneScrollView.contentSize.width/2, _levelSceneScrollView.contentSize.height/2);
    [self addChild:pausedS z:100];
    
}
-(void) closePause
{
    [self removeChild:pausedS];
    self.currentLevel.paused = NO;
    self.currentLevel.userInteractionEnabled = YES;
    _attack.enabled = YES;
    _skillOne.enabled =YES;
    _skillTwo.enabled = YES;
    _pausedButton.enabled = YES;
}
-(void) buttonControl :(BOOL) bo
{
    _attack.enabled = bo;
    _skillOne.enabled =bo;
    _skillTwo.enabled = bo;
    _pausedButton.enabled = bo;
}
-(void) reloadGame
{
    [self buttonControl:YES];
    [info initHPMP];
    switch ([[NSUserDefaults standardUserDefaults]integerForKey:@"SwitchLevel"]) {
        case 0:
        {
            [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            Level_0First * level = (Level_0First *)[CCBReader load:@"Level_0lab"];
            _levelSceneScrollView.contentNode = level;
            self.currentLevel = level;
            level.delegate = self;
        }
            break;
        case 1:
        {
            Level_1MC * level = (Level_1MC *)[CCBReader load:@"Level_1MC"];
            _levelSceneScrollView.contentNode = level;
            self.currentLevel = level;
            level.delegate = self;

        }
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
}
-(void) appearFailCount
{
    self.currentLevel.paused = YES;
    self.currentLevel.userInteractionEnabled = NO;
    _attack.enabled = NO;
    _skillOne.enabled =NO;
    _skillTwo.enabled = NO;
    _pausedButton.enabled = NO;
    FailCount * fail = (FailCount *)[CCBReader load:@"failCount"];
    fail.position = ccp(0, 0);
    fail.delegate = self;
    [self addChild:fail z:100];
    
}
-(void) onEnter
{
    [super onEnter];
    CCLOG(@"onEnter");
    return;
}
@end
