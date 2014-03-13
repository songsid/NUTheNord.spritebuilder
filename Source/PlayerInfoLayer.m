//
//  PlayerInfoLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PlayerInfoLayer.h"

@implementation PlayerInfoLayer

-(void) isPopPlayerInfoScene:(id)sender
{
    [self.delegate popPlayerInfo];
}

@end
