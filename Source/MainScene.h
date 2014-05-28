//
//  MainScene.h
//  PROJECTNAME
//
//  Created by Sid on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "SkipIntoLayer.h"
#import "MainMenuLayer.h"
#import "PlayerInfoScene.h"
#import "FirstTimeIntroLayer.h"
#import "FirstTimeIntroTwoLayer.h"


@interface MainScene : CCScene<SkipIntoLayerDelegate,MainMenuLayerDelegate,FirstTimeIntroLayer,FirstTimeTwoDelegate>
{

}
@property (nonatomic,strong)CCScrollView * mainScrollView;
-(void) skipInto;
-(void) pushPlayerInfoScene;
-(void) pushLeagueScene;
-(void) firstTimeEnd;
-(void) firstTimeIntro;
-(void) selectFirstTime;
@end
