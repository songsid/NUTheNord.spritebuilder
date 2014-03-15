//
//  LeagueLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LeagueLayerDelegate <NSObject>

-(void) popLeagueScene;
-(void) pushLevel :(CCNode *) level;

@end

#import "CCNode.h"
#define kSimpleTableViewRowHeight 24
#define kSimpleTableViewInset 50
@interface LeagueLayer : CCNode<CCTableViewDataSource>

@property (nonatomic,weak) id <LeagueLayerDelegate> delegate;
@property (nonatomic,strong) NSArray * levels;
@property (nonatomic,strong) CCTableView* tableView ;
@end
