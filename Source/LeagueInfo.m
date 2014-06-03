//
//  LeagueInfo.m
//  NUTheNord
//
//  Created by Sid on 2014/5/26.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LeagueInfo.h"

@implementation LeagueInfo
-(void) didLoadFromCCB
{
    
  //  [[OALSimpleAudio sharedInstance] stopAllEffects];
  //  [[OALSimpleAudio sharedInstance] playEffect:@"prepareMusic.mp3" loop:YES];

}

-(void) setMissionString :(NSString *) str
{
    _mission.string = str;
}
-(void) setMissionDetailString :(NSString *) str
{
    _missionDetail.string = str;
}

@end
