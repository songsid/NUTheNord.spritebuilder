//
//  Level_P.h
//  NUTheNord
//
//  Created by Sid on 2014/3/16.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol Level_PDelegate <NSObject>

-(void) popLevelScene;

@end
#import "CCNode.h"

@interface Level_P : CCNode
{
    CCPhysicsNode * _physicsNode;
    CCNode * _player;
    CCNode * _attack;
    CCNode * _endPosition;
    BOOL enableJump;
}
@property (nonatomic,weak) id<Level_PDelegate> delegate;
@property (nonatomic,assign) float yTarget;
@property (nonatomic,assign) float ySpeed;
@property (nonatomic,assign) CGPoint playerY;
@property (nonatomic,assign) float y;
@property (nonatomic,assign) float t;

-(void) attack;
@end
