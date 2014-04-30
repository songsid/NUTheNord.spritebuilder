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
    //[[OALSimpleAudio sharedInstance] playEffect:@"street1.mp3" loop:YES];

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
    tutorialStep = 0;
    

    _beginGnd.physicsBody.collisionType = @"beginGnd";
    _player = (CCNode *) [CCBReader load:@"PlayerSaber"];
    _player.position = ccp(80, 90);

    [_physicsNode addChild:_player z:10];
    _player.physicsBody.collisionType = @"Player";
  
    [_player.physicsBody applyForce:ccp(8000.0f, 0.0f)];

    _kake = (CCNode *) [CCBReader load:@"Kate"];
    _kake.position = ccp(0,50);
    _kake.scale = 0.8;
    _kake.physicsBody.collisionType = @"Kake";
    [_physicsNode addChild:_kake];
    
    [self createEnemyRobert:ccp(1000, 43)];
    [self createEnemyRobert:ccp(2563, 43)];



    

    ///setting blueGnd
    [self buildBludGnd:ccp(391, 0)];
    [self buildBludGnd:ccp(1277, 0)];
    [self buildBludGnd:ccp(2219.8f,0)];
    [self buildBludGnd:ccp(2971.2f,0)];
    [self buildBludGnd:ccp(3300.0f,0)];
    [self buildBludGnd:ccp(3570.0f,0)];
    [self buildBludGnd:ccp(4636.0f,0)];
    
    
    ///setting blueTopGnd
    [self buildBlueTopGnd:ccp(446, 95)];
    [self buildBlueTopGnd:ccp(1507, 95)];
    [self buildBlueTopGnd:ccp(1630, 140)];
    [self buildBlueTopGnd:ccp(2042, 95)];
    [self buildBlueTopGnd:ccp(2160, 140)];
    [self buildBlueTopGnd:ccp(3225, 95)];
    [self buildBlueTopGnd:ccp(3755, 95)];
    [self buildBlueTopGnd:ccp(3812, 140)];
    [self buildBlueTopGnd:ccp(3935, 140)];
    [self buildBlueTopGnd:ccp(4051, 95)];
    [self buildBlueTopGnd:ccp(4463, 95)];
    [self buildBlueTopGnd:ccp(4582, 95)];
}
-(void) buildBludGnd :(CGPoint)x
{
    _blueGnd = [CCBReader load:@"blueGnd"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd];
}
-(void) buildBlueTopGnd :(CGPoint)x
{
    _blueTopGnd = [CCBReader load:@"blueTopGnd"];
    _blueTopGnd.anchorPoint = ccp(0, 0);
    _blueTopGnd.physicsBody.elasticity = 0;
    _blueTopGnd.position = x;
    _blueTopGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueTopGnd];
}
-(void) createEnemyRobert :(CGPoint)x
{
    _enemy = [CCBReader load:@"enemy"];
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.position = x;
    [_physicsNode addChild:_enemy];
}
///                    create point  speed           delayshotTime
-(void) createRobertShot :(CGPoint)x :(CGPoint)v :(float) delayShot
{
    _robertShot = [CCBReader load:@"robertShotStable"];
    _robertShot.anchorPoint = ccp(0.5, 0.5);
    _robertShot.position = x;
    _robertShot.physicsBody.collisionType = @"robertShot";
    [_physicsNode addChild:_robertShot];
    [self scheduleBlock:^(CCTimer *timer) {
        _robertShotPre = [CCBReader load:@"robertShot"];
        _robertShotPre.position = x;
        [self addChild:_robertShotPre];
        
        [self scheduleBlock:^(CCTimer *timer) {
                [_robertShot.physicsBody applyForce:v];
        } delay:delayShot];
        [self scheduleBlock:^(CCTimer *timer) {
                [_robertShot removeFromParent];
                [_robertShotPre removeFromParent];
        } delay:2.0f];
    } delay:0.8f];
}
-(void) createEnemyMouse :(CGPoint)x :(CGPoint)v :(CGPoint)vJ :(float)jumpTime :(int)mode
{
    switch (mode) {
        case 0:
        {
            _enemy = [CCBReader load:@"enemyYamabuta"];
            _enemy.physicsBody.collisionType = @"enemy";
            _enemy.position = x;
            [_physicsNode addChild:_enemy];
            [_enemy.physicsBody applyForce:v];
            [self scheduleBlock:^(CCTimer *timer) {
                [_enemy.physicsBody applyImpulse:vJ];
            } delay:jumpTime];
        }
            break;
            
        case 1:
        {
            _enemy = [CCBReader load:@"enemyMouse"];
            _enemy.physicsBody.collisionType = @"enemy";
            _enemy.position = x;
            [_physicsNode addChild:_enemy];
            [_enemy.physicsBody applyForce:v];
            [self scheduleBlock:^(CCTimer *timer) {
                [_enemy.physicsBody applyImpulse:vJ];
            } delay:jumpTime/2];
            [self scheduleBlock:^(CCTimer *timer) {
                [_enemy.physicsBody applyImpulse:vJ];
            } delay:jumpTime];
        }
            
            break;
        default:
            break;
    }



}
-(void) update:(CCTime)delta

{
    CCLOG(@"delta = %f",delta);
    CCLOG(@"player.y = %f playerY.y = %f",_player.position.y,_playerY.y);

    ///////////set jump
/*    if ((( ((_playerY.y - _player.position.y)<10*delta) && (_playerY.y - _player.position.y)>=0.0f)) || (((_playerY.y - _player.position.y)>(-10*delta) && (_playerY.y - _player.position.y)<=0.0f))) {
        //CCLOG(@"Y==Y");
        enableJump = YES;
    }else{
        enableJump = NO;
    }*/
       ///set labBG
    float bg = _player.position.x- _playerY.x;
    _labBG1.position = ccp(_labBG1.position.x - bg*0.25f,_labBG1.position.y );
    _labBG2.position = ccp(_labBG2.position.x - bg*0.25f,_labBG2.position.y );
    _labBG3.position = ccp(_labBG3.position.x - bg*0.25f,_labBG3.position.y );
    /////// player & layer position
    if ((_player.position.x -_playerY.x > 100*delta) && (_player.position.x <selfAncherPosition+160) && (_player.position.x >selfAncherPosition+100)) {
        [_player.physicsBody applyForce:ccp(-5000.0f *delta, 0.0f)];

    }
    if ((_player.position.x -_playerY.x < 100*delta)&& (_player.position.x <selfAncherPosition+160)&& (_player.position.x >selfAncherPosition+100))
    {
        [_player.physicsBody applyForce:ccp(5000.0f *delta, 0.0f)];
    }
    if (_player.position.x>selfAncherPosition+160) {
        float f;
        f = _player.position.x - selfAncherPosition+160;
        if (f>55) {
            f=55;
        }
        f = 1 + f*(-1/55);
        [_player.physicsBody applyForce:ccp(-6000.0f * delta * f, 0.0f)];

    }
    if (_player.position.x<selfAncherPosition+100) {
        float f;
        float f2;
        f = selfAncherPosition +100 - _player.position.x;
        CCLOG(@"f = %f",f);
        if (f>50) {
            f = 70;
        }
        f2 = f*f;
        CCLOG(@"f2 = %f",f2);
        f =  f2/4900;
        if ((_player.position.x-_playerY.x > 120 *delta) && f<1) {
            [_player.physicsBody applyForce:ccp(-5000.0f *delta, 0.0f)];
            CCLOG(@"+70 --ing");
        }else  {
        [_player.physicsBody applyForce:ccp(8000.0f *delta * f, 0.0f)];
        }

        CCLOG(@"Force = %f \n f=%f",6000*delta*f,f);
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
            tutorialStep = tutorialStep+1;
        }
    }
    
    if (_player.position.x >320){
    
        if (!dialogTwo) {

        [[NSUserDefaults standardUserDefaults]setInteger:10 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        _returnTouch = nil;

        [self.delegate touchToPaused:dialogTwo];
            dialogTwo = YES;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogTouchOne = YES;
                self.userInteractionEnabled = YES;
            } delay:0.5f]; //set delay for touch remove dialog
            tutorialStep = tutorialStep+1;

        }
    
    }
    
    /// robert shot!!

    if (_player.position.x > 500) {
        if (!roberShotBo) {
            roberShotBo = YES;
            [self createRobertShot:ccp(970, 65) :ccp(-20000, 0) :1.0f];
            tutorialStep = tutorialStep+1;
        }
    }
    
    /// jump over robertshot
    if (_player.position.x > 730) {
        if (!dialogFour) {
            
            [[NSUserDefaults standardUserDefaults]setInteger:12 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            _returnTouch = nil;
            self.userInteractionEnabled = NO;
            [self.delegate touchToPaused:dialogTwo];;
            dialogFour = YES;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogTouchOne = YES;
                self.userInteractionEnabled = YES;
            } delay:0.5f]; //set delay for touch remove dialog
            tutorialStep = tutorialStep+1;

        }
    }
    if (_player.position.x >970){
        
        if (dialogThree) {
            //remove robertshot!
            [[NSUserDefaults standardUserDefaults]setInteger:14 forKey:@"DialogInt"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            _returnTouch = nil;
            self.userInteractionEnabled = NO;
            [self.delegate touchToPaused:dialogThree];
            dialogThree = NO;
            [self scheduleBlock:^(CCTimer *timer) {
                dialogButtonOne = YES;
               
            } delay:0.0f]; //set delay for touch remove dialog
            tutorialStep = tutorialStep+1;
        }
        
    }
    if (_player.position.x > 2080 && tutorialStep ==5) {
        [self createRobertShot:ccp(2555, 65) :ccp(-30000, 0) :0.63f];
        
        tutorialStep = tutorialStep+1;

    }
    
    if (_player.position.x > 2480 && tutorialStep ==6) {
        [self createEnemyMouse:ccp(3100, 65) :ccp(-5000, 0) :ccp(-100, 600) :3.0f :0];
        tutorialStep = tutorialStep +1;
    }
    
    if (_player.position.x > 2970 && tutorialStep ==7) {
        [[NSUserDefaults standardUserDefaults]setInteger:16 forKey:@"DialogInt"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        tutorialStep = tutorialStep +1;
        [self.delegate touchToPaused:NO];
    }
    
    if (_player.position.x > 3000 && tutorialStep ==8) {
        [self createEnemyMouse:ccp(3500, 65) :ccp(-5000, 0) :ccp(-100, 600) :2.5f :0];
        tutorialStep = tutorialStep +1;
    }
    
    if (_player.position.x > 3200 && tutorialStep ==9) {
        [self createEnemyRobert:ccp(3693, 43)];
        [self createRobertShot:ccp(3663,65) :ccp(-20000, 0) :1.4f];
        tutorialStep = tutorialStep +1;
    }
    if (_player.position.x > 4613 && tutorialStep ==8) {
        [self createEnemyMouse:ccp(5100, 65) :ccp(-5000, 0) :ccp(-50, 600) :2.5f :1];
        tutorialStep = tutorialStep +1;
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
            [_player.physicsBody applyForce:ccp(6500.0f *delta, 0.0f)];
            self.position = ccp(self.position.x - 50*delta, self.position.y);
            selfAncherPosition = selfAncherPosition +50*delta;
            CCLOG(@"11111");
        }else{
            self.position = ccp(self.position.x - 100*delta, self.position.y);
            selfAncherPosition = selfAncherPosition + 100*delta;
            CCLOG(@"2");
        }
    }
    if(_sFire)
    {
        _sFire.position = ccp(_player.position.x+25,1000);
    }
    CCLOG(@"_sFire.position = %f,%f",_sFire.position.x,_sFire.position.y);
    _playerY = ccp(_player.position.x, _player.position.y);
 
    CCLOG(@"_player.position.x = %f\n _playerY.position.x = %f",_player.position.x,_playerY.x);
    CCLOG(@"ancherpoint = %f",selfAncherPosition);
    ///////////
    ///set kake
        //set position
    if (((_player.position.y - _playerY.y >=0)&&(_player.position.y - _playerY.y <0.1)) && enableJump) {
        
            _kake.position = ccp(_playerY.x, _playerY.y-0.1f);
        
        
        }else{_kake.position = ccp(_player.position.x,_kake.position.y);}
    
        //set scale
    if (_player.position.y>=_kake.position.y) {
                if ( _player.position.y - _kake.position.y <180) {
                    _kake.scale =  (1-((_player.position.y +38 - _kake.position.y)/135))*1;
                }else {
            _kake.scale = 0;
        }
    }else{
        _kake.scale = 0;
    }
    
   // [_kake.physicsBody applyForce:ccp(0, -90*delta)];
    CCLOG(@"_kate.force = %f,%f",_kake.physicsBody.force.x,_kake.physicsBody.force.y);
    CCLOG(@"_kate.pox = %f,%f",_kake.position.x,_kake.position.y);
    CCLOG(@"up playerY = %f",_playerY.x);

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
    
    if (enableJump )
    {
        [_player.physicsBody applyImpulse:ccp(0,650.0f)];
        if (![[_player.userObject runningSequenceName]isEqualToString:@"Attack"]) {
        [_player.userObject runAnimationsForSequenceNamed:@"Jump"];
        }
    }
    return ;
}

-(void)attack
{
    if (![[_player.userObject runningSequenceName]isEqualToString:@"Attack"] && [self.delegate getMp]>=3) {
        [self.delegate transMpDecrease:3];
        ///step 4 robert remove
    int dia = [[NSUserDefaults standardUserDefaults]integerForKey:@"DialogInt"];
    if ([self.delegate getPaused]&& (dia>=12)&& dialogButtonOne) {
        [self.delegate removeDialog];
        dialogButtonOne = NO;
        self.userInteractionEnabled = YES;
        CCLOG(@"removedia");
        }
    
    [_player.userObject runAnimationsForSequenceNamed:@"Attack"];
    CCLOG(@"%@",[_player.userObject runningSequenceName]);

        // shot an attack at px40 py and at the update move to px 25 py1000
        _sFire = [CCBReader load:@"attack"];
        _sFire.position = ccp(_player.position.x + 50, _player.position.y);
        _sFire.physicsBody.collisionType = @"slFire";
        [_physicsNode addChild:_sFire];
        
        [self scheduleBlock:^(CCTimer *timer) {
            [_sFire removeFromParent];
                    } delay:0.2f];
        
        CCLOG(@"slamfire = %@,position = %f,%f",_sFire,_sFire.position.x,_sFire.position.y);
        CCLOG(@"slfire = %@",_sFire.physicsBody.collisionType);
       /* CCNode * sand = [CCBReader load:@"Sand"];
        sand.position = ccp(_player.position.x-20,_player.position.y);
        [self addChild:sand];*/
        [[OALSimpleAudio sharedInstance] playEffect:@"slam3.mp3"];
    }
}





-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
   /* NSString * str = [_player.userObject runningSequenceName];
      if ([str isEqualToString:@"Attack"]) {
         
          CGPoint  point = ccp(nodeB.position.x,nodeB.position.y);
          [nodeB removeFromParentAndCleanup:YES];
          CCNode * exp = [CCBReader load:@"EnemyKill"];
          exp.position = point;
          [self addChild:exp];
          

        CCLOG(@"attack!!!!!!!!!!!!!!");
          return YES;   }else */
        [self.delegate transHpDecrease:1];
        [_player.physicsBody applyImpulse:ccp(-300,430.0f)];
        CCLOG(@"damage!!!");
        return NO;
    
    CCLOG(@"collision P E!!");
    
}
-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    if ([[_player.userObject runningSequenceName]isEqualToString:@"Attack"]) {
        CGPoint  point = ccp(nodeB.position.x,nodeB.position.y);
        [nodeB removeFromParentAndCleanup:YES];
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

-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enableJump = YES;
    CCLOG(@"Player on thee _blueGnd!!!!!");
    return YES;
}
-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enableJump = YES;
    CCLOG(@"Player on thee _blueGnd!!!!!");
    return YES;
}
-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA beginGnd:(CCNode *)nodeB
{
    enableJump = YES;
    CCLOG(@"Player on thee _bGnd!!!!!");
    return YES;
}
-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enableJump = NO;

}
-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA beginGnd:(CCNode *)nodeB
{
    enableJump = NO;
    
}

-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair slFire:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    CCLOG(@"slamFire!!");
    CGPoint oldnb = ccp(nodeB.position.x, nodeB.position.y);
    [nodeB removeFromParent];
    CCNode * sf = [CCBReader load:@"slamFire"];
    sf.position = ccp(oldnb.x, oldnb.y);
    [self addChild:sf];
    return YES;
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA Kake:(CCNode *)nodeB
{
    CCLOG(@"ig begin");
    return [pair ignore];
}

-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA Kake:(CCNode *)nodeB
{
    CCLOG(@"player & kake ignore!");
    return [pair ignore];
}
@end


