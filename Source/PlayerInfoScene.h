//
//  PlayerInfoScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//


#import "PlayerInfoLayer.h"
#import "CCNode.h"
#import "SkipIntoLayer.h"


@interface PlayerInfoScene : CCNode <PlayerInfoLayerDelegate>
{
    CCScrollView * _playerInfoScrollView;
    
}

-(void) popPlayerInfo;
@end
