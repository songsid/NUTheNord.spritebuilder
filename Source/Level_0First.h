//
//  Level_0First.h
//  NUTheNord
//
//  Created by Sid on 2014/4/12.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol Level_FirstDelegate <NSObject>

-(void) popLevelScene;
-(void) transHpDecrease :(int) damage;
-(void) transHpIncrease :(int) plus;
-(void) transMpDecrease :(int) count;
-(void) transMpIncrease :(int) destance;

@end
#import "CCNode.h"
#import "LevelScene.h"
#import "Player.h"
#import "HPMPInfo.h"

@interface Level_0First : CCNode <CCPhysicsCollisionDelegate>
{
    CCPhysicsNode * _physicsNode;
    CCNode * _player;
    CCNode * _attack;
    CCNode * _endPosition;
    CCNode * _boss;
    CCNode * _enemy;
    CCNode * _road;
    CCNode * _sword;
    float mpDistance;
    BOOL enableJump;
}
@property (nonatomic,weak) id <Level_FirstDelegate> delegate;

@property (nonatomic,assign) float yTarget;
@property (nonatomic,assign) float ySpeed;
@property (nonatomic,assign) CGPoint playerY;
@property (nonatomic,assign) float y;
@property (nonatomic,assign) float t;

-(void) attack;
@end

