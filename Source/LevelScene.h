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
@interface LevelScene : CCNode <LeagueSceneDelegate,LevelDelegate,Level_PDelegate>
{
    CCScrollView * _levelSceneScrollView;
    
}

-(void) sendLevel:(CCNode *)level;
-(void) popLevelScene;
@end
