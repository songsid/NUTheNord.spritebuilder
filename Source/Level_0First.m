//
//  Level_0First.m
//  NUTheNord
//
//  Created by Sid on 2014/4/12.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "Level_0First.h"
#import "LevelScene.h"
#define selfAncherPositionMax  95;
#define selfAncherPositionMin  70;

@implementation Level_0First

-(void) didLoadFromCCB
{
    [[OALSimpleAudio sharedInstance] playEffect:@"street1.mp3" loop:YES];

    self.userInteractionEnabled = TRUE;
    _physicsNode.collisionDelegate = self; //set collisionDelegate
    mpDistance = 0.0f;
    dialogOne = NO;
    dialogTwo = NO;
    dialogThree = YES;
    dialogFour = NO;
    dialogTouchOne = NO;
    dialogButtonOne = NO;
    roberShotBo = NO;
    
    _player = (CCNode *) [CCBReader load:@"PlayerSaber"];
    _player.position = ccp(80, 90);
    _player.anchorPoint = ccp(0.5f,0.5f);
    [_physicsNode addChild:_player z:10];
    _player.physicsBody.collisionType = @"Player";
  
    [_player.physicsBody applyForce:ccp(20000.0f, 0.0f)];
    
    _kake = (CCNode *) [CCBReader load:@"Kate"];
    _kake.position = ccp(0,50);
    _kake.scale = 0.8;
    [self addChild:_kake z:9];
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(1000, 43);
    [_physicsNode addChild:_enemy];
    
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = ccp(2563, 43);
    [_physicsNode addChild:_enemy];
    
    _robertShot = [CCBReader load:@"robertShot"];
    _robertShot.anchorPoint = ccp(0.5, 0.5);
    _robertShot.position = ccp(970, 65);
    _robertShot.physicsBody.collisionType = @"robertShot";
    
    _robertShotTwo = [CCBReader load:@"robertShot"];
    _robertShotTwo.anchorPoint = ccp(0.5, 0.5);
    _robertShotTwo.position = ccp(2555, 65);
    _robertShotTwo.physicsBody.collisionType = @"robertShot";
    [_physicsNode addChild:_robertShotTwo];
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
    CCLOG(@"delta = %f",delta);
    CCLOG(@"player.y = %f playerY.y = %f",_player.position.y,_playerY.y);

    ///////////set jump
    if ((( ((_playerY.y - _player.position.y)<10*delta) && (_playerY.y - _player.position.y)>=0.0f)) || (((_playerY.y - _player.position.y)>(-10*delta) && (_playerY.y - _player.position.y)<=0.0f))) {
        //CCLOG(@"Y==Y");
        enableJump = YES;
    }else{
        enableJump = NO;
    }
    ///set kake
       _kake.position = ccp(_player.position.x,_kake.position.y);
    if (_player.position.y - _kake.position.y <180) {
        _kake.scale =  (1-((_player.position.y - _kake.position.y)/135))*1;
    }else {
        _kake.scale = 0;}
    
    CCLOG(@"up playerY = %f",_playerY.x);
    ///set labBG
    float bg = _player.position.x- _playerY.x;
    _labBG1.position = ccp(_labBG1.position.x - bg*0.25f,_labBG1.position.y );
    _labBG2.position = ccp(_labBG2.position.x - bg*0.25f,_labBG2.position.y );
    _labBG3.position = ccp(_labBG3.position.x - bg*0.25f,_labBG3.position.y );
    /////// player & layer position
    if ((_player.position.x -_playerY.x > 100*delta) && (_player.position.x <selfAncherPosition+95) && (_player.position.x >selfAncherPosition+70)) {
        [_player.physicsBody applyForce:ccp(-5000.0f *delta, 0.0f)];

    }
    if ((_player.position.x -_playerY.x < 100*delta)&& (_player.position.x <selfAncherPosition+95)&& (_player.position.x >selfAncherPosition+70))
    {
        [_player.physicsBody applyForce:ccp(5000.0f *delta, 0.0f)];

    }
    if (_player.position.x>selfAncherPosition+95) {
        [_player.physicsBody applyForce:ccp(-6000.0f * delta, 0.0f)];

    }
    if (_player.position.x<selfAncherPosition+70) {
       [_player.physicsBody applyForce:ccp(6000.0f *delta, 0.0f)];
        
    }
    ///////
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
        [self.delegate touchToPaused:dialogOne];
        CCLOG(@"touchToJump");
            dialogOne = YES;
        }
    }
    
    if (_player.position.x >320){
    
        if (!dialogTwo) {

        [[NSUserDefaults standardUserDefaults]setInteger:10 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        _returnTouch = nil;

        [self.delegate touchToPaused:dialogTwo];;
            dialogTwo = YES;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogTouchOne = YES;
                self.userInteractionEnabled = YES;
            } delay:0.5f]; //set delay for touch remove dialog
        }
    
    }
    
    /// robert shot!!
    if (_player.position.x > 650) {
        if (!roberShotBo) {
            roberShotBo = YES;

            [_physicsNode addChild:_robertShot];

            [_robertShot.physicsBody applyForce:ccp(-20000,0)];
        }
    }
    
    /// jump over robertshot
/*    if (_player.position.x > 730) {
        if (!dialogFour) {
            
            [[NSUserDefaults standardUserDefaults]setInteger:14 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            _returnTouch = nil;
            self.userInteractionEnabled = NO;
            [self.delegate touchToPaused:dialogTwo];;
            dialogFour = YES;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogTouchOne = YES;
                self.userInteractionEnabled = YES;
            } delay:0.5f]; //set delay for touch remove dialog
        }
    }*/
    if (_player.position.x >970){
        
        if (dialogThree) {
            //remove robertshot!
            [[NSUserDefaults standardUserDefaults]setInteger:12 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            _returnTouch = nil;
            self.userInteractionEnabled = NO;
            [self.delegate touchToPaused:dialogThree];
            dialogThree = NO;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogButtonOne = YES;
               
            } delay:0.2f]; //set delay for touch remove dialog
        }
        
    }
    if (_player.position.x > 2227) {
        [_robertShotTwo.physicsBody applyForce:ccp(-10000,0)];
    }
    ///// set MPincrease!!!
    
    mpDistance  = mpDistance + 100*delta;
    if (mpDistance>=150) {
        [self.delegate transMpIncrease:1];
        mpDistance = 0.0f;

    }
    

    ///EndGame/////////////////////////////////////////////////////////////
    if((_player.position.x > 7000 )||(_player.position.y<0))
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
    
    ///player<self endgame
    if(_player.position.x < selfAncherPosition-40 )
    {
        [self.delegate popLevelScene];
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"DialogInt"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    
    
    
    ////////////player & layer position
    
    if (![self.delegate getPaused]) {
        if ((_player.position.x-_playerY.x)<1) {
            [_player.physicsBody applyForce:ccp(8000.0f *delta, 0.0f)];
            self.position = ccp(self.position.x - 60*delta, self.position.y);
            selfAncherPosition = selfAncherPosition +60*delta;
            CCLOG(@"1");
        }else{
            self.position = ccp(self.position.x - 100*delta, self.position.y);
            selfAncherPosition = selfAncherPosition + 100*delta;
            CCLOG(@"2");
        }
    }
    _playerY = ccp(_player.position.x, _player.position.y);
 
    CCLOG(@"_player.position.x = %f\n _playerY.position.x = %f",_player.position.x,_playerY.x);
    CCLOG(@"ancherpoint = %f",selfAncherPosition);
    ///////////
}



-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    _returnTouch  = touch;
    int dia = [[NSUserDefaults standardUserDefaults]integerForKey:@"DialogInt"];
    CCLOG(@"dialog int = %d",dia);
    CCLOG(@"levelscenepause = %hhd",[self.delegate getPaused]);
    if ([self.delegate getPaused]&& (dia>=10)&& dialogTouchOne) {
        [self.delegate removeDialog];
        self.userInteractionEnabled =YES;
        dialogTouchOne = NO;
        CCLOG(@"removedia");
    }
    
    if (enableJump)
    {
        [_player.physicsBody applyImpulse:ccp(0,650.0f)];
        [_player.userObject runAnimationsForSequenceNamed:@"Jump"];

    }
    return ;
}
-(void)attack
{
    // CCLOG(@"attack");
    int dia = [[NSUserDefaults standardUserDefaults]integerForKey:@"DialogInt"];
    if ([self.delegate getPaused]&& (dia>=12)&& dialogButtonOne) {
        [self.delegate removeDialog];
        dialogButtonOne = NO;
        self.userInteractionEnabled = YES;
        CCLOG(@"removedia");
        }
    
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
    [[OALSimpleAudio sharedInstance] playEffect:@"slam3.mp3"];
    


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
          CGPoint  point = ccp(nodeB.position.x,nodeB.position.y);
          [nodeB removeFromParent];
          CCNode * exp = [CCBReader load:@"EnemyKill"];
          exp.position = point;
          [self addChild:exp];
        CCLOG(@"attack!!!!!!!!!!!!!!");
          
    }else
    {
        [self.delegate transHpDecrease:1];
        [_player.physicsBody applyImpulse:ccp(-100,300.0f)];
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

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA robertShot:(CCNode *)nodeB
{
    CCNode * beshot = [CCBReader load:@"beshot"];
    beshot.position = ccp(_player.position.x+4, _player.position.y+70);
    [self addChild:beshot];
    [_player.physicsBody applyImpulse:ccp(-150,500.0f)];
        [self.delegate transHpDecrease:4];
        CCLOG(@"damage!!!");

    return YES;
}
@end


