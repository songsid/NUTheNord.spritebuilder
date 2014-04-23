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
-(int) getHp;
-(void) touchToPaused :(UITouch *) touch;
-(void) removeDialog;
-(BOOL) getPaused;
@end


#import "CCNode.h"
#import "HPMPInfo.h"

@class LevelScene;
@interface Level_0First : CCNode <CCPhysicsCollisionDelegate>
{
    LevelScene * _levelScene;
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
    BOOL dialogOne;
    BOOL dialogTwo;
    BOOL dialogTouchOne;
}
@property (nonatomic,weak) id <Level_FirstDelegate> delegate;
@property (nonatomic,weak) UITouch * returnTouch;
@property (nonatomic,assign) float yTarget;
@property (nonatomic,assign) float ySpeed;
@property (nonatomic,assign) CGPoint playerY;
@property (nonatomic,assign) float y;
@property (nonatomic,assign) float t;

-(void) attack;
@end

