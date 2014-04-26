//
//  LevelScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//



#import "CCNode.h"
#import "LeagueScene.h"
#import "Level_0.h"
#import "Level_P.h"
#import "Level_1.h"
#import "Level_0First.h"
#import "HPMPInfo.h"
#import "Dialog.h"


@interface LevelScene : CCNode <LeagueSceneDelegate,LevelDelegate,Level_PDelegate,Level_1Delegate,Level_FirstDelegate,DialogDelegate>
{

    CCButton * _skillOne;
    CCButton * _skillTwo;
    CCButton * _attack;
    HPMPInfo * info;
    Dialog * diag;
    CCNode * _dialog;
    int count;
}
@property (nonatomic,strong) CCNode * currentLevel;
@property (nonatomic,strong) CCNode * HPMP;
@property (nonatomic) BOOL entered;
@property (nonatomic,strong) CCScrollView * levelSceneScrollView;

-(void) popLevelScene;
-(void) transHpDecrease :(int) damage;
-(void) transHpIncrease :(int) plus;
-(void) transMpDecrease :(int) count;
-(void) transMpIncrease :(int) destance;
-(int) getHp;
-(void) touchToPaused:(BOOL)ny;
-(void) removeDialog;
-(BOOL) getPaused;
@end
