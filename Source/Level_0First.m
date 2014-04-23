//
//  Level_0First.m
//  NUTheNord
//
//  Created by Sid on 2014/4/12.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "Level_0First.h"
#import "LevelScene.h"
@implementation Level_0First

-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    _physicsNode.collisionDelegate = self; //set collisionDelegate
    mpDistance = 0.0f;
    dialogOne = NO;
    dialogTwo = NO;
    dialogTouchOne = NO;
    
    
    _player = (CCNode *) [CCBReader load:@"Player"];
    _player.position = ccp(80, 90);
    _player.anchorPoint = ccp(0.5f,0.5f);
    [_physicsNode addChild:_player];
    _player.physicsBody.collisionType = @"Player";
  
    [_player.physicsBody applyForce:ccp(10000.0f, 0.0f)];
 
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(532, 43);
    [_physicsNode addChild:_enemy];
  
   /*
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(700, 43);
    [_physicsNode addChild:_enemy];
    
    
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(850, 43);
    [_physicsNode addChild:_enemy];
    
    
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(990, 43);
    [_physicsNode addChild:_enemy];
    
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(1080, 43);
    [_physicsNode addChild:_enemy];
    
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(1300, 43);
    [_physicsNode addChild:_enemy];
   */

}

-(void) update:(CCTime)delta
{
    ///////////set jump
    if ((((_playerY.y - _player.position.y)<0.2f) && (_playerY.y - _player.position.y)>=0.0f) || ((_playerY.y - _player.position.y)>(-0.1f) && (_playerY.y - _player.position.y)<=0.0f)) {
        //CCLOG(@"Y==Y");
        enableJump = YES;
    }else{
        enableJump = NO;
    }
    
    CCLOG(@"up playerY = %f",_playerY.x);

   /* if (![self.delegate getPaused]) {

        if (_player.physicsBody.force.x <200) {
            [_player.physicsBody applyForce:ccp(10000.0f, 0.0f)];
            self.position = ccp(self.position.x - (30+ 0.1*(_player.physicsBody.force.x) )*delta, self.position.y);
        }else
        {
            self.position = ccp(self.position.x - 100*delta, self.position.y);
        }
    }*/
 //   _player.position = ccp(_player.position.x + 100*delta, _player.position.y);
    //CCLOG(@"\nposition = %f, %hhd",_player.position.y,enableJump);
//    float xTarget = 80 - _player.position.x;
/*    float xTarget = 100 - self.position.x ;
    CGPoint oldLayerPosition = _player.position;
    
    float yNew = oldLayerPosition.y;
    float xNew = xTarget * 0.1 + oldLayerPosition.x * (1.0f - 0.1);
    
    _player.position = ccp(xNew, yNew);
*/
    
 ///set Tutorial
    
    if (_player.position.x > 0) {
        if (!dialogOne) {

        _returnTouch = nil;
        self.userInteractionEnabled = NO;
        [self touchToJump:_returnTouch];
        CCLOG(@"touchToJump");
            dialogOne = YES;
        }
    }
    
    if (_player.position.x >320){
    
        if (!dialogTwo) {

        [[NSUserDefaults standardUserDefaults]setInteger:10 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        _returnTouch = nil;

        [self touchToJump:_returnTouch];
            dialogTwo = YES;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogTouchOne = YES;
                self.userInteractionEnabled = YES;
            } delay:2.0f]; //set delay for touch remove dialog
        }
    
    }
    ///// set MPincrease!!!
    
    mpDistance  = mpDistance + 100*delta;
    if (mpDistance>=150) {
        [self.delegate transMpIncrease:1];
        mpDistance = 0.0f;

    }
    

    ///EndGame/////////////////////////////////////////////////////////////
    if((_player.position.x > 3060 )||(_player.position.y<0))
    {
        [self.delegate popLevelScene];
        CCLOG(@"gameover!!!");
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    ///HP=0 Endgame
    if ([self.delegate getHp]<=0) {
        [self.delegate popLevelScene];
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    if(_player.position.x - self.position.x <10)
    {
        [self.delegate popLevelScene];
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    
    
    ////////////
    
    if (![self.delegate getPaused]) {
        if ((_player.position.x-_playerY.x)<1) {
            [_player.physicsBody applyForce:ccp(10000.0f, 0.0f)];
            self.position = ccp(self.position.x - 60*delta, self.position.y);
            CCLOG(@"1");
        }else{
            self.position = ccp(self.position.x - 100*delta, self.position.y);
            CCLOG(@"2");
        }
    }
    _playerY = ccp(_player.position.x, _player.position.y);
    CCLOG(@"_player.position.x = %f\n _playerY.position.x = %f",_player.position.x,_playerY.x);
}



-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    _returnTouch  = touch;
    int dia = [[NSUserDefaults standardUserDefaults]integerForKey:@"DialogInt"];
    CCLOG(@"dialog int = %d",dia);
    CCLOG(@"levelscenepause = %hhd",[self.delegate getPaused]);
    if ([self.delegate getPaused]&& (dia>=10)&& dialogTouchOne) {
        [self.delegate removeDialog];
        dialogTouchOne = NO;
        CCLOG(@"removedia");
    }
    
    if (enableJump)
    {
        [_player.physicsBody applyImpulse:ccp(0,800.f)];
        [_player.userObject runAnimationsForSequenceNamed:@"Jump"];

    }
    return ;
}
-(void)attack
{
    // CCLOG(@"attack");
    
    [_player.userObject runAnimationsForSequenceNamed:@"Attack"];
    CCLOG(@"%@",[_player.userObject runningSequenceName]);
    [self scheduleBlock:^(CCTimer *timer){
        CCNode * slamCCP = [CCBReader load:@"SlamCCP"];
        slamCCP.position = ccp(_player.position.x+39,_player.position.y);
        [self addChild:slamCCP];
        
        CCNode * sand = [CCBReader load:@"Sand"];
        sand.position = ccp(_player.position.x-20,_player.position.y);
        [self addChild:sand];
        [self scheduleBlock:^(CCTimer *timer) {
            [self removeChild:slamCCP cleanup:YES];
            [self removeChild:sand cleanup:YES];
        } delay:5.0f];
    }delay:0.2f];
    

    //##
    /*   Bana * banana = [[Bana alloc]init];
     
     banana.position =ccp(_player.position.x+50, _player.position.y+50);
     banana.anchorPoint = ccp(0.5f, 0.5f);
     [_physicsNode addChild:banana];
     [banana.physicsBody applyImpulse:ccp(300.0f, 0.0f)];
     */
    /*    _attack = [CCBReader load:@"bana"];
     _attack.position = ccp(_player.position.x+50, _player.position.y+50);
     _attack.anchorPoint = ccp(0.5f,0.5f);
     [_physicsNode addChild:_attack];
     
     [_attack.physicsBody applyImpulse:ccp(300.0f, 0.f)];
     _attack.physicsBody.collisionType = @"Bana";
     
     */

    
    
}

-(void) touchToJump :(UITouch *) touch
{
    [self.delegate touchToPaused:touch];
 /*   while (1) {
        if (touch) {
        _paused = NO;
        return;
        }
    }*/
    
}

-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bana:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    [nodeA removeFromParentAndCleanup:YES];
    [nodeB removeFromParentAndCleanup:YES];
    CCLOG(@"colision!!!!");
    return YES;
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    NSString * str = [_player.userObject runningSequenceName];
      if ([str isEqualToString:@"Attack"]) {
        CCLOG(@"attack!!!!!!!!!!!!!!");
          
    }else
    {
        [self.delegate transHpDecrease:1];
        CCLOG(@"damage!!!");
    }
    CCLOG(@"collision P E!!");
    return YES;
}
-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    if ([[_player.userObject runningSequenceName]isEqualToString:@"Attack"]) {
        CGPoint  point = ccp(nodeB.position.x,nodeB.position.y);
        [nodeB removeFromParent];
        CCNode * exp = [CCBReader load:@"EnemyKill"];
        exp.position = point;
        [self addChild:exp];
    }
    return YES;
}
-(void) ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    CCLOG(@"collision separata!!!!");
}


-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Sword:(CCNode *)nodeA Player:(CCNode *)nodeB
{
    CCLOG(@"collision sword!!!");
    return  YES;
}

@end


