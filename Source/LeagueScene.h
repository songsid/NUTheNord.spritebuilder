//
//  LeagueScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "LeagueLayer.h"

@interface LeagueScene : CCNode<LeagueLayerDelegate>
{
    CCScrollView * _leagueSceneScrollView;
}

-(void)popLeagueScene;
@end
