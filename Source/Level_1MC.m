//
//  Level_1MC.m
//  NUTheNord
//
//  Created by Sid on 2014/5/6.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "Level_1MC.h"
#import "LevelScene.h"

@implementation Level_1MC
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    
    _physicsNode.collisionDelegate = self; //set collisionDelegate
    mpDistance = 0.0f;
    bRHP = 0;
    dialogOne = NO;
    dialogTwo = NO;
    dialogThree = YES;
    dialogFour = NO;
    dialogTouchOne = NO;
    dialogButtonOne = NO;
    roberShotBo = NO;
    endgame = NO;
    tutorialStep = 0;
    _physicsNode.zOrder = 5;

    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            _player = (CCNode *) [CCBReader load:@"PlayerSaber"];
            
            break;
        case 1:
            _player = (CCNode *) [CCBReader load:@"PlayerLancer"];
            break;
        case 2:
            _player = (CCNode *) [CCBReader load:@"PlayerSaber"];
            break;
            
        default:
            break;
    }
    
    _player.position = ccp(80, 90);
    [_physicsNode addChild:_player z:1];
    _player.physicsBody.collisionType = @"Player";
     [_player.physicsBody applyForce:ccp(8000.0f, 0.0f)];
    
    _kake = (CCNode *) [CCBReader load:@"Kate"];
    _kake.position = ccp(0,50);
    _kake.scale = 0.8;
    _kake.physicsBody.collisionType = @"Kake";
    [_physicsNode addChild:_kake z:0];
    ///setting blueGnd
    [self buildBludGnd:ccp(0, 0) :101];
    [self buildBludGnd:ccp(770, 0) :100];
    [self buildBludGnd:ccp(1400, 0) :99];
    [self buildBludGnd:ccp(2019.8f,0) :98];
    [self buildBludGndS:ccp(2871.2f,0) :97];
    [self buildBludGndS:ccp(3000.0f,0) :96];
    [self buildBludGndS:ccp(3570.0f,0) :95];
    [self buildBludGnd:ccp(4036.0f,0) :94];
    [self buildBludGndS:ccp(4800.0f,0) :93];
    [self buildBludGndS:ccp(5400.0f,0) :92];
}
-(void) buildBludGnd :(CGPoint)x :(NSInteger) z
{
    _blueGnd = [CCBReader load:@"blueGnd"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd z:z];
}
-(void) buildBludGndS :(CGPoint)x :(NSInteger) z
{
    _blueGnd = [CCBReader load:@"blueGndS"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd z:z];
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
-(void) createSkillShot
{
    _skillFire = [CCBReader load:@"skillSaberShot"];
    _skillFire.position = ccp(_player.position.x +65, _player.position.y +40);
    _skillFire.physicsBody.collisionType = @"skillFire";
    [_physicsNode addChild:_skillFire z:10];
}

-(void) update:(CCTime)delta
{
    
    /////// player & layer position
    if (!deltaStop) {
        
        if ((_player.position.x -_playerY.x > 100*delta) && (_player.position.x <selfAnchorPosition+160) && (_player.position.x >selfAnchorPosition+100)) {
            [_player.physicsBody applyForce:ccp(-5000.0f *delta, 0.0f)];
            
        }
        if ((_player.position.x -_playerY.x < 100*delta)&& (_player.position.x <selfAnchorPosition+160)&& (_player.position.x >selfAnchorPosition+100))
        {
            [_player.physicsBody applyForce:ccp(5000.0f *delta, 0.0f)];
        }
        if (_player.position.x>selfAnchorPosition+160) {
            float f;
            f = _player.position.x - selfAnchorPosition+160;
            if (f>55) {
                f=55;
            }
            f = 1 + f*(-1/55);
            [_player.physicsBody applyForce:ccp(-6000.0f * delta * f, 0.0f)];
            
        }
        if (_player.position.x<selfAnchorPosition+100) {
            float f;
            float f2;
            f = selfAnchorPosition +100 - _player.position.x;
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
    }else if (deltaStop){
        _player.position = ccp(skillPosition.x,_player.position.y);
    }

    
    
    
    
    
    ///// set MPincrease!!!
    
    mpDistance  = mpDistance + 100*delta;
    if (mpDistance>=150) {
        [self.delegate transMpIncrease:1];
        mpDistance = 0.0f;
        
    }
    ////////////player & layer position
    
    if (![self.delegate getPaused] && !deltaStop) {
        if ((_player.position.x-_playerY.x)<1) {
            [_player.physicsBody applyForce:ccp(6500.0f *delta, 0.0f)];
            self.position = ccp(self.position.x - 50*delta, self.position.y);
            selfAnchorPosition = selfAnchorPosition +50*delta;
            CCLOG(@"11111");
        }else{
            self.position = ccp(self.position.x - 100*delta, self.position.y);
            selfAnchorPosition = selfAnchorPosition + 100*delta;
            CCLOG(@"2");
        }
    }
    if (deltaStop) {
        self.position = ccp(self.position.x, self.position.y);
    }
    if(_sFire)
    {
        _sFire.position = ccp(_player.position.x+25,1000);
    }
    CCLOG(@"_sFire.position = %f,%f",_sFire.position.x,_sFire.position.y);
    _playerY = ccp(_player.position.x, _player.position.y);
    
    CCLOG(@"_player.position.x = %f\n _playerY.position.x = %f",_player.position.x,_playerY.x);
    CCLOG(@"ancherpoint = %f",selfAnchorPosition);
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
            CCLOG(@"enableJump!!");
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

-(void) skill
{
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
        {
            if ((![[_player.userObject runningSequenceName]isEqualToString:@"Attack"] || ![[_player.userObject runningSequenceName]isEqualToString:@"Jump"]) && [self.delegate getMp]>=9) {
                deltaStop = YES;
                _skillBG.position = ccp(selfAnchorPosition, 0); //load From ccb skillBG
                _skillBG.visible = YES;
                
                skillPosition = ccp(_player.position.x, _player.position.y);
                [self.delegate transMpDecrease:9];
                [_player.physicsBody applyImpulse:ccp(0, 700)];
                [_player.userObject runAnimationsForSequenceNamed:@"Skill"];
                [self scheduleBlock:^(CCTimer *timer) {
                    [self.delegate scrollViewShake];
                    CCNode * skillBombccp = [CCBReader load:@"skillCCPSaberTwo"];
                    skillBombccp.position = ccp(_player.position.x +140, _player.position.y);
                    [self addChild:skillBombccp];
                    
                    CCNode * skillBombccpo = [CCBReader load:@"skillCCPSaberTwo"];
                    skillBombccpo.position = ccp(_player.position.x +220, _player.position.y);
                    [self addChild:skillBombccpo];
                    
                    CCNode * skillBombccpa = [CCBReader load:@"skillCCPSaberTwo"];
                    skillBombccpa.position = ccp(_player.position.x +300, _player.position.y);
                    [self addChild:skillBombccpa];
                    
                    [self createSkillShot];
                    
                    [self scheduleBlock:^(CCTimer *timer) {
                        [_skillFire.physicsBody applyImpulse:ccp(10000, 0)];
                    } delay:0.3];
                } delay:1.0f ];
                [self scheduleBlock:^(CCTimer *timer) {
                    deltaStop = NO;
                    [self scheduleBlock:^(CCTimer *timer) {
                        _skillBG.visible = NO;
                    } delay:0.8];
                    
                } delay:1.5];
            }
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
            
            
    }
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

-(float) getSelfAnchorPosition
{
    return selfAnchorPosition;
}
-(BOOL) getDeltaStop
{
    return deltaStop;
}
@end
