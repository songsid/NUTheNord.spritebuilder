//
//  LeagueScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LeagueSceneDelegate <NSObject>

-(void) sendLevel:(CCNode *)level;

@end


#import "CCNode.h"
#import "LeagueLayer.h"

@interface LeagueScene : CCNode<LeagueLayerDelegate>
{
    CCScrollView * _leagueSceneScrollView;
}
@property (nonatomic,weak) id <LeagueSceneDelegate> delegate;
-(void) popLeagueScene;
-(void) pushLevel:(CCScene *)scene;
@end
