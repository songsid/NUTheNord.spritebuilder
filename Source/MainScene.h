//
//  MainScene.h
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "SkipIntoLayer.h"
#import "MainMenuLayer.h"
#import "PlayerInfoScene.h"



@interface MainScene : CCNode<SkipIntoLayerDelegate,MainMenuLayerDelegate>
{
    CCScrollView * _mainScrollView;
}

-(void) skipInto;
-(void) pushPlayerInfoScene;
-(void) pushLeagueScene;

@end
