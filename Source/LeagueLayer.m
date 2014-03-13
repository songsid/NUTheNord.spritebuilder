//
//  LeagueLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LeagueLayer.h"

@implementation LeagueLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
}
-(void) isPopLeagueScene:(id)sender
{
    [self.delegate popLeagueScene];
    CCLOG(@"popleague!");
}
@end
