//
//  Level_P.m
//  NUTheNord
//
//  Created by Sid on 2014/3/16.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "Level_P.h"

@implementation Level_P
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
}

-(void) update:(CCTime)delta
{
    if ((((_playerY.y - _player.position.y)<0.2f) && (_playerY.y - _player.position.y)>=0.0f) || ((_playerY.y - _player.position.y)>(-0.1f) && (_playerY.y - _player.position.y)<=0.0f)) {
        //CCLOG(@"Y==Y");
        enableJump = YES;
    }else{
        enableJump = NO;
        
    }
    
    _playerY = ccp(0, _player.position.y);
    
    
    
    _player.position = ccp(_player.position.x + 70*delta, _player.position.y);
    //CCLOG(@"\nposition = %f, %hhd",_player.position.y,enableJump);
    float xTarget = 80 - _player.position.x;
    CGPoint oldLayerPosition = self.position;
    
    float yNew = oldLayerPosition.y;
    float xNew = xTarget * 0.1 + oldLayerPosition.x * (1.0f - 0.1);
    
    self.position = ccp(xNew, yNew);
    
    
    ///EndGame/////////////////////////////////////////////////////////////
    if((_player.position.x > 2000 )||(_player.position.y<0))
    {
        [self.delegate popLevelScene];
        CCLOG(@"gameover!!!");
    }
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (enableJump)
    {
        [_player.physicsBody applyImpulse:ccp(0, 1400.f)];
    }
}
-(void)attack
{
    _attack = [CCBReader load:@"arrow"];
    _attack.position = ccp(_player.position.x+40, _player.position.y+50);
    [_physicsNode addChild:_attack];
    /*    float rotationRadians = CC_DEGREES_TO_RADIANS(1);
     
     CGPoint directionVector = ccp(sinf(rotationRadians), cosf(rotationRadians));
     CGPoint force = ccpMult(directionVector, 50000);
     */ [_attack.physicsBody applyImpulse:ccp(2000.0f, 10.0f)];
}

@end
