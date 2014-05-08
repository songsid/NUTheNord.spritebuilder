//
//  LevelScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//



#import "CCNode.h"
#import "LeagueScene.h"
//#import "Level_0.h"
//#import "Level_P.h"
//#import "Level_1.h"
#import "Level_1MC.h"
#import "Level_0First.h"
#import "HPMPInfo.h"
#import "Dialog.h"
#import "ClearCount.h"
#import "PauseSetting.h"
@interface LevelScene : CCNode <LeagueSceneDelegate,/*LevelDelegate,Level_PDelegate,Level_1Delegate,*/Level_FirstDelegate,DialogDelegate,Level_1MCDelegate,ClearCountDelegate,PauseSettingDelegate>
{

    CCButton * _skillOne;
    CCButton * _skillTwo;
    CCButton * _attack;
    CCButton * _pausedButton;
    HPMPInfo * info;
    Dialog * diag;
    ClearCount * clearCo;
    Level_1MC * levelMc;
    CCNode * _dialog;
    PauseSetting * pausedS;
    int count;
    
    ///Level_1MC BG
    CCNode * _mcBG1_1;
    CCNode * _mcBG1_2;
    CCNode * _mcBG2_1;
    CCNode * _mcBG2_2;
    CCNode * _mcBG3_1;
    CCNode * _mcBG3_2;
    CCNode * _mcBG4_1;
    CCNode * _mcBG4_2;
    NSArray * _BG1;
    NSArray * _BG2;
    NSArray * _BG3;
    NSArray * _BG4;
    
}
@property (nonatomic,strong) CCNode * currentLevel;
@property (nonatomic,strong) CCNode * HPMP;
@property (nonatomic) BOOL entered;
@property (nonatomic,strong) CCScrollView * levelSceneScrollView;

-(void) popLevelScene;
-(void) transHpDecrease :(int) damage;
-(void) transHpIncrease :(int) plus;
-(void) transMpDecrease :(int) mpcount;
-(void) transMpIncrease :(int) destance;
-(int) getHp;
-(int) getMp;
-(void) touchToPaused:(BOOL)ny;
-(void) removeDialog;
-(BOOL) getPaused;
-(void) scrollViewShake;
-(void) closePause;
-(void) buttonControl: (BOOL) bo;
@end
