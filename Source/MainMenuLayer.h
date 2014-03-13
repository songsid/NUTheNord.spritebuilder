//
//  MainMenuLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol MainMenuLayerDelegate <NSObject>
-(void) pushPlayerInfoScene;
-(void) pushLeagueScene;

@end
#import "CCNode.h"

@interface MainMenuLayer : CCNode
@property (nonatomic,weak) id <MainMenuLayerDelegate> delegate;
@end
