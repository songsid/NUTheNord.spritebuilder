//
//  MainMenuLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer
-(void)didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
}

-(void) isPlayerInfoScene:(id) sender
{
    [self.delegate pushPlayerInfoScene];
}

-(void) isLeagueScene:(id)sender
{
    [self.delegate pushLeagueScene];
}
@end
