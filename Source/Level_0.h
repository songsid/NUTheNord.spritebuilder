//
//  Level_0.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LevelDelegate <NSObject>

-(void) popLevelScene;
@end
#import "CCNode.h"
#import "LevelObject.h"
@interface Level_0 : CCNode
{
    CCPhysicsNode * _physicsNode;
    CCNode * _player;
    CCNode * _attack;
    CCNode * _endPosition;
    BOOL enableJump;
}
@property (nonatomic,weak)  id<LevelDelegate> delegate;
@property (nonatomic,assign) float yTarget;
@property (nonatomic,assign) float ySpeed;
@property (nonatomic,assign) CGPoint playerY;
@property (nonatomic,assign) float y;
@property (nonatomic,assign) float t;

-(void) attack;



@end
