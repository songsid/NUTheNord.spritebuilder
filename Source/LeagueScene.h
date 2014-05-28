//
//  LeagueScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LeagueSceneDelegate <NSObject>




@end


#import "CCNode.h"
#import "LeagueLayer.h"
#import "LeagueInfo.h"

@interface LeagueScene : CCNode<LeagueLayerDelegate,CCAlertviewDelegate>
{
    CCScrollView * _leagueSceneScrollView;
    CCButton * _enter;
    CCButton * _cancel;
    LeagueInfo * leagueInfo;
    BOOL showInfo;
    int levelCount;
}
@property (nonatomic,weak) id <LeagueSceneDelegate> delegate;

-(void) popLeagueScene;
-(void) pushLevel;
-(void) intoLevelOrNot;
-(void) controlSlide:(int)slide;
-(void) showLeagueInfo:(CGPoint) x:(int)level;
@end
