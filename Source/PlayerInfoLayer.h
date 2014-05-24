//
//  PlayerInfoLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol PlayerInfoLayerDelegate <NSObject>
-(void) playerInfoLayerAdd;
-(void) playerInfoLayerRemove;

@end
#import "CCNode.h"

#import "SpriteSaber.h"
@class PlayerInfoScene;
@interface PlayerInfoLayer : CCNode
{
    CCButton * _bgButton;

}
@property (nonatomic,weak) id<PlayerInfoLayerDelegate> delegate;
@end
