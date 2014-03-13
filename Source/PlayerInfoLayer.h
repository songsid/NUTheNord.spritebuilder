//
//  PlayerInfoLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol PlayerInfoLayerDelegate <NSObject>

-(void) popPlayerInfo;

@end
#import "CCNode.h"

@interface PlayerInfoLayer : CCNode
@property (nonatomic,weak)id <PlayerInfoLayerDelegate> delegate;
@end
