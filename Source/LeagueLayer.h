//
//  LeagueLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LeagueLayerDelegate <NSObject>

-(void) popLeagueScene;
-(void) pushLevel;
-(void) intoLevelOrNot;
-(void) controlSlide:(int)slide;
@end


#import "CCNode.h"
#import "CCAlertView.h"
#import "LeagueScene.h"
#define kSimpleTableViewRowHeight 24
#define kSimpleTableViewInset 50

@interface LeagueLayer : CCNode<CCTableViewDataSource,LeagueSceneDelegate>
{
    CCButton * _isSelectLevel0;
    CCButton * _isPopLeagueScene;
    CCButton * _isSelectAreaOne;
    CCButton * _isSelectAreaTwo;
    int slide;
}


@property (nonatomic,weak) id <LeagueLayerDelegate,CCAlertviewDelegate> delegate;

@property (nonatomic,strong) NSArray * levels;
@property (nonatomic) int levelNum;
@property (nonatomic) int tableInt;
@property (nonatomic,strong) CCTableView* tableView ;
@property (nonatomic) BOOL blockButton;
@property (nonatomic,strong) CCNode * sendLevel;
@end
