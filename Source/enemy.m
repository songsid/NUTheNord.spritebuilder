//
//  enemy.m
//  NUTheNord
//
//  Created by Sid on 2014/3/20.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "enemy.h"

@implementation enemy

-(void) didLoadFromCCB
{
    self.anchorPoint = ccp(0, 0);
    
    self.physicsBody.collisionType = @"Enemy";
}


@end
