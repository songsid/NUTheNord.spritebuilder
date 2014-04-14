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


@interface LevelScene : CCNode <LeagueSceneDelegate,LevelDelegate,Level_PDelegate,Level_1Delegate,Level_FirstDelegate>
{
    CCScrollView * _levelSceneScrollView;
    CCNode * _skillOne;
    CCNode * _skillTwo;
    HPMPInfo * info;
}
@property (nonatomic,strong) CCNode * currentLevel;
@property (nonatomic,strong) CCNode * HPMP;
@property (nonatomic) BOOL entered;

-(void) popLevelScene;
-(void) transHpDecrease :(int) damage;
-(void) transHpIncrease :(int) plus;
-(void) transMpDecrease :(int) count;
-(void) transMpIncrease :(int) destance;
@end
