//
//  LeagueLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LeagueLayerDelegate <NSObject>

-(void) popLeagueScene;

@end

#import "CCNode.h"

@interface LeagueLayer : CCNode
@property (nonatomic,weak) id <LeagueLayerDelegate> delegate;
@end
