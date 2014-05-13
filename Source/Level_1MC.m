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

-(NSMutableArray *) arrayEnemyBat
{
    if (!_arrayEnemyBat) {
        _arrayEnemyBat = [NSMutableArray array];
    }
    return _arrayEnemyBat;
}
-(NSMutableArray *) arrayGnd
{
    if (!_arrayGnd) {
        _arrayGnd = [NSMutableArray array];
    }
    return _arrayGnd;
}
-(NSMutableArray *) arrayEnemyPig
{
    if (!_arrayEnemyPig) {
        _arrayEnemyPig = [NSMutableArray array];
    }
    return  _arrayEnemyPig;
}
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
    enemyAttackStep = 0;

    _mcBGFront.zOrder = 200;
    _mcBGFrontUp.zOrder = 200;
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            _player = (CCNode *) [CCBReader load:@"PlayerSaber"];
            break;
        case 1:
            _player = (CCNode *) [CCBReader load:@"PlayerLancer"];
            break;
        case 2:
            _player = (CCNode *) [CCBReader load:@"PlayerArcher"];
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
    
    [self createStone:ccp(1542, 51)];
    [self createStone:ccp(2959, 232)];
    [self createStone:ccp(3186, 106)];
    [self createStone:ccp(4761, 60)];
    ///setting blueGnd
    [self buildBludGnd:ccp(0, 0) :101];
    [self buildBludGnd:ccp(350, 0) :100];
    [self buildBludGnd:ccp(1274, 0) :99];
    [self buildBludGnd:ccp(1874,0) :98];
    [self buildBludGnd:ccp(2913.0f,55) :96];
    [self buildBludGnd:ccp(3314.0f,-25) :95];
    [self buildBludFHGnd:ccp(4997, 12) :95];
/*
    [self buildBludGnd:ccp(4036.0f,0) :94];
    [self buildBludGnd:ccp(4700.0f,0) :93];
    [self buildBludGnd:ccp(5000.0f,0) :92];
    [self buildBludGnd:ccp(5400.0f,0) :92];
    [self buildBludGnd:ccp(6000.0f,0) :92];
    [self buildBludGnd:ccp(6400.0f,0) :92];
    [self buildBludGnd:ccp(7000.0f,0) :92];
    [self buildBludGnd:ccp(7400.0f,0) :92];
    [self buildBludGnd:ccp(8000.0f,0) :92];
    [self buildBludGnd:ccp(8400.0f,0) :92];
    [self buildBludGnd:ccp(9000.0f,0) :92];
*/
    //setting MCGndTop
    [self buildBlueTopGnd:ccp(298, 99)];
    [self buildBlueTopGnd:ccp(358, 147)];
    [self buildBlueTopGnd:ccp(524, 147)];
    [self buildBlueTopGnd:ccp(690, 147)];
    [self buildBlueTopGnd:ccp(847, 147)];
    [self buildBlueTopGnd:ccp(977, 213)];
    [self buildBlueTopGnd:ccp(1134, 213)];
    [self buildBlueTopGnd:ccp(1906, 99)];
    [self buildBlueTopGnd:ccp(1963, 147)];
    [self buildBlueTopGnd:ccp(2025, 194)];
    
    [self buildBlueTopBGnd:ccp(2169, 231)];
    [self buildBlueTopBGnd:ccp(2259, 231)];
    [self buildBlueTopBGnd:ccp(2349, 231)];
    [self buildBlueTopBGnd:ccp(2446, 187)];
    [self buildBlueTopBGnd:ccp(2536, 187)];
    [self buildBlueTopBGnd:ccp(2623, 187)];
    [self buildBlueTopBGnd:ccp(2757, 232)];
    [self buildBlueTopBGnd:ccp(2847, 232)];
    [self buildBlueTopBGnd:ccp(2932, 232)];
    
    [self buildBlueTopGnd:ccp(2528, 51)];
    [self buildBlueTopGnd:ccp(2659, 51)];
    [self buildBlueTopGnd:ccp(2777, 51)];
    [self buildBlueTopGnd:ccp(3946, 24)];
    [self buildBlueTopGnd:ccp(4054, 24)];
    [self buildBlueTopGnd:ccp(4169, 30)];
    [self buildBlueTopGnd:ccp(4273, 41)];
    [self buildBlueTopGnd:ccp(4389, 52)];
    
    [self buildBlueTopBGnd:ccp(3581, 187)];
    [self buildBlueTopBGnd:ccp(3667, 187)];
    [self buildBlueTopBGnd:ccp(3803, 227)];
    [self buildBlueTopBGnd:ccp(3963, 229)];
    [self buildBlueTopBGnd:ccp(4131, 223)];
    [self buildBlueTopBGnd:ccp(4292, 232)];
    [self buildBlueTopBGnd:ccp(4447, 242)];
    [self buildBlueTopBGnd:ccp(4605, 242)];
    [self buildBlueTopBGnd:ccp(4765, 241)];

    



}
-(void) buildBludGnd :(CGPoint)x :(NSInteger) z
{
    _blueGnd = [CCBReader load:@"MCGnd"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd z:z];
    CCLOG(@"BBG");
}
-(void) buildBludFHGnd :(CGPoint)x :(NSInteger) z
{
    _blueGnd = [CCBReader load:@"MCGndFH"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd z:z];
        CCLOG(@"BBFHG");
}
-(void) buildBludGndS :(CGPoint)x :(NSInteger) z
{
    _blueGnd = [CCBReader load:@"blueGndS"];
    _blueGnd.anchorPoint = ccp(0, 0);
    _blueGnd.position = x;
    _blueGnd.physicsBody.elasticity = 0;
    _blueGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueGnd z:z];
        CCLOG(@"BBGs");
}
-(void) buildBlueTopGnd :(CGPoint)x
{
    _blueTopGnd = [CCBReader load:@"MCTopGnd"];
    _blueTopGnd.physicsBody.elasticity = 0;
    _blueTopGnd.position = x;
    _blueTopGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueTopGnd];
        CCLOG(@"BBTG");
}
-(void) buildBlueTopBGnd :(CGPoint)x
{
    _blueTopGnd = [CCBReader load:@"MCTopBridge"];
    _blueTopGnd.physicsBody.elasticity = 0;
    _blueTopGnd.position = x;
    _blueTopGnd.physicsBody.collisionType = @"blueGnd";
    [_physicsNode addChild:_blueTopGnd];
            CCLOG(@"BBTBG");
}
-(void) createStone :(CGPoint) x
{
    _enemy = [CCBReader load:@"MCEnemyStone"];
    _enemy.position = x;
    _enemy.physicsBody.collisionType = @"Stone";
    [_physicsNode addChild:_enemy];
        CCLOG(@"CS");
}
-(void) createBat :(CGPoint) x
{
    _enemy = [CCBReader load:@"enemyBat"];
    _enemy.position = x;
    _enemy.physicsBody.collisionType = @"enemy";
    _enemy.scale = 0.5f;
    [_physicsNode addChild:_enemy];
    [self.arrayEnemyBat addObject:_enemy];
        CCLOG(@"CB");
    
}
-(void) createPig :(CGPoint) x
{
    _enemy = [CCBReader load:@"enemyPig"];
    _enemy.position = x;
    _enemy.physicsBody.collisionType = @"enemy";
    [_physicsNode addChild:_enemy];
    [_enemy.physicsBody applyImpulse:ccp(-400, 0)];
    [self.arrayEnemyPig addObject:_enemy];
        CCLOG(@"CP");
}
-(void) createArrowShot //Archer attack
{
    _skillFire = [CCBReader load:@"PlayerArcherArrow"];
    _skillFire.position = ccp(_player.position.x +34, _player.position.y+ 30);
    _skillFire.physicsBody.collisionType = @"slFire";
    _skillFire.physicsBody.affectedByGravity = YES;
    
    [self scheduleBlock:^(CCTimer *timer) {
        [_physicsNode addChild:_skillFire];
        if (_skillFire.parent) {
            [_skillFire.physicsBody applyImpulse:ccp(440,50)];}
    } delay:0.3f];
    [self scheduleBlock:^(CCTimer *timer) {
        [_skillFire removeFromParentAndCleanup:YES];
    } delay:0.7f];
    
}
-(void) createSkillShot
{
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            _skillFire = [CCBReader load:@"skillSaberShot"];
            _skillFire.position = ccp(_player.position.x +65, _player.position.y +40);
            _skillFire.physicsBody.collisionType = @"skillFire";
            [_physicsNode addChild:_skillFire z:10];
            break;
        case 1:
        {
            _skillFire = [CCBReader load:@"skillLancerShot"];
            _skillFire.position = ccp(_player.position.x +34, _player.position.y+ 30);
            _skillFire.physicsBody.collisionType = @"skillFire";
            [self scheduleBlock:^(CCTimer *timer) {
                [_physicsNode addChild:_skillFire z:10];
                [_skillFire.physicsBody applyImpulse:ccp(10000, 0)];
            } delay:2.2f];
            
        }
            break;
        case 2:
        {
            _skillFire = [CCBReader load:@"PlayerArcherArrow"];
            [_skillFire.userObject runAnimationsForSequenceNamed:@"Skill"];
            _skillFire.position = ccp(_player.position.x +65, _player.position.y +40);
            _skillFire.physicsBody.collisionType = @"skillFire";
            _skillFire.physicsBody.affectedByGravity = NO;
            _skillFire.physicsBody.allowsRotation = NO;
            [_physicsNode addChild:_skillFire z:10];
            [self scheduleBlock:^(CCTimer *timer) {
                if (_skillFire.parent) {
                    [_skillFire.physicsBody applyImpulse:ccp(350, 0)];}
            } delay:0.0f];
            [self scheduleBlock:^(CCTimer *timer) {
                [_skillFire removeFromParentAndCleanup:YES];
            } delay:0.7f];
        }
            break;
            
        default:
            break;
    }
    
}

-(void) update:(CCTime)delta
{
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            if (_skillFire.position.x - _player.position.x >230 && ![[_skillFire.userObject runningSequenceName]isEqualToString:@"Skill"]) {
                if (_skillFire.parent) {
                    [_skillFire removeFromParentAndCleanup:YES];
                }
            }
            break;
            
        default:
            break;
    }
    
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
    
    ///set create monster
    
    if (_player.position.x> 1543 && tutorialStep ==0)
    {
        [self createBat:ccp(1943, 300)];
        tutorialStep = tutorialStep +1;
    }
    if (_player.position.x >2100 && tutorialStep ==1) {
        [self createPig:ccp(2867, 285)];
        tutorialStep = tutorialStep +1;
    }
    
    
    
    
    ///control monster attack
    for (CCNode * enemy in _arrayEnemyBat) {
        if (enemy.position.x -_player.position.x <480 && enemy.position.x > selfAnchorPosition) {
            CCLOG(@"bat position = %f,%f",enemy.position.x,enemy.position.y);
            if (enemy.position.x -_player.position.x <300 && enemyAttackStep == 0) {
                CCLOG(@"intoFirstBat");
                if (enemy.parent) {
                    if (enemyAttackStep ==0 && enemy.position.y <160) {
                        CCLOG(@"1speed up!");
                        if (enemy.parent) [enemy.physicsBody applyImpulse:ccp(-200, 2500)];
                        enemyAttackStep =1;
                    }
                
                    if (enemyAttackStep ==1 && enemy.position.y <120){
                        enemyAttackStep =2;
                        [self scheduleBlock:^(CCTimer *timer) {
                            if (enemy.parent) [enemy.physicsBody applyImpulse:ccp(-200, 1500)];
                        } delay:1.0f];

                        CCLOG(@"2speed up!");
                        
                        
                        

                        
                    }
                    if (enemyAttackStep ==2 && enemy.position.y < 100){
                        if (enemy.parent) [enemy.physicsBody applyImpulse:ccp(-200, 2000)];
                        CCLOG(@"3speed up!");
                        return;
                    }

                }
                
                    
                
                
            }
        }
    }
    
    for (CCNode * enemy in _arrayEnemyPig) {
        if (enemy.position.x - selfAnchorPosition < 480 && enemy.position.x > selfAnchorPosition) {
            if(enemyEnableJump){
                CCLOG(@"pig can jump!");
                int a = arc4random()%7;
                    if (a == 1) {
                        CCLOG(@"pig Jump!!");
                        if (enemy.parent) {
                    [enemy.physicsBody applyImpulse:ccp(-200, 2000)];
                        }
                    }
                }
        }
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
 /*   if(_sFire)
    {
        _sFire.position = ccp(_player.position.x+25,1000);
    }
 */   CCLOG(@"_sFire.position = %f,%f",_sFire.position.x,_sFire.position.y);
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
    
    if (enableJump && !deltaStop)
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
    if (![[_player.userObject runningSequenceName]isEqualToString:@"Attack"]) {
        
        ///step 4 robert remove
        int dia = [[NSUserDefaults standardUserDefaults]integerForKey:@"DialogInt"];
        if ([self.delegate getPaused]&& (dia>=12)&& dialogButtonOne) {
            [self.delegate removeDialog];
            dialogButtonOne = NO;
            self.userInteractionEnabled = YES;
            CCLOG(@"removedia");
        }
        
        switch ([[NSUserDefaults standardUserDefaults]integerForKey:@"Spirit"]) {
            case 0:
            {
                if ([self.delegate getMp]>=3) {
                    [_player.userObject runAnimationsForSequenceNamed:@"Attack"];
                    CCLOG(@"%@",[_player.userObject runningSequenceName]);
                    [self.delegate transMpDecrease:3];
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
                break;
            }
            case 1:
            {
                if ([self.delegate getMp]>=3) {

                [_player.userObject runAnimationsForSequenceNamed:@"Attack"];
                CCLOG(@"%@",[_player.userObject runningSequenceName]);
                [self.delegate transMpDecrease:3];
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
                break;
            }
            case 2:
            {
                if ([self.delegate getMp]>2 && !_skillFire.parent) {
                    [_player.userObject runAnimationsForSequenceNamed:@"Attack"];
                    CCLOG(@"%@",[_player.userObject runningSequenceName]);
                    [self.delegate transMpDecrease:2];
                    [self createArrowShot];
                }
                break;
            }
            default:
                break;
        }
        
    }
}
-(void) skill
{
    switch ([[NSUserDefaults standardUserDefaults] integerForKey:@"Spirit"]) {
        case 0:
        {
            if ((![[_player.userObject runningSequenceName]isEqualToString:@"Attack"] && enableJump) && [self.delegate getMp]>=9) {
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
            if ((![[_player.userObject runningSequenceName]isEqualToString:@"Attack"] && enableJump) && [self.delegate getMp]>=9) {
                deltaStop = YES;
                _skillBG.position = ccp(selfAnchorPosition, 0); //load From ccb skillBG
                _skillBG.visible = YES;
                
                skillPosition = ccp(_player.position.x, _player.position.y);
                [self.delegate transMpDecrease:9];
                [_player.physicsBody applyImpulse:ccp(0, 700)];
                [_player.userObject runAnimationsForSequenceNamed:@"Skill"];
                [self scheduleBlock:^(CCTimer *timer) {
                    
                    
                    [self createSkillShot];
                    
                    [self scheduleBlock:^(CCTimer *timer) {
                        [self.delegate scrollViewShake];
                        //     [_skillFire.physicsBody applyImpulse:ccp(10000, 0)];
                    } delay:1.0f];
                } delay:1.0f ];
                [self scheduleBlock:^(CCTimer *timer) {
                    deltaStop = NO;
                    [self scheduleBlock:^(CCTimer *timer) {
                        _skillBG.visible = NO;
                    } delay:0.2f];
                    
                } delay:4.3f];
            }
        }
            break;
        case 2:
        {
            if ((![[_player.userObject runningSequenceName]isEqualToString:@"Attack"] && enableJump) && [self.delegate getMp]>=9) {
                deltaStop = YES;
                _skillBG.position = ccp(selfAnchorPosition, 0); //load From ccb skillBG
                _skillBG.visible = YES;
                
                skillPosition = ccp(_player.position.x, _player.position.y);
                [self.delegate transMpDecrease:9];
                //[_player.physicsBody applyImpulse:ccp(0, 700)];
                [_player.userObject runAnimationsForSequenceNamed:@"Skill"];
                [self scheduleBlock:^(CCTimer *timer) {
                    /*   [self.delegate scrollViewShake];
                     CCNode * skillBombccp = [CCBReader load:@"skillCCPSaberTwo"];
                     skillBombccp.position = ccp(_player.position.x +140, _player.position.y);
                     [self addChild:skillBombccp];
                     
                     CCNode * skillBombccpo = [CCBReader load:@"skillCCPSaberTwo"];
                     skillBombccpo.position = ccp(_player.position.x +220, _player.position.y);
                     [self addChild:skillBombccpo];
                     
                     CCNode * skillBombccpa = [CCBReader load:@"skillCCPSaberTwo"];
                     skillBombccpa.position = ccp(_player.position.x +300, _player.position.y);
                     [self addChild:skillBombccpa];
                     */
                    [self createSkillShot];
                    
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

-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enableJump = NO;
    
}

-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair enemy:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enemyEnableJump = YES;
    return YES;
}
-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair enemy:(CCNode *)nodeA blueGnd:(CCNode *)nodeB
{
    enemyEnableJump = NO;
    
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    CCLOG(@"player collision bat!!");
    if (nodeA.parent){   [nodeA.physicsBody applyImpulse:ccp(-200,100)];}
    if (nodeB.parent)
    {
        nodeB.position = ccp(nodeB.position.x, nodeB.position.y+50);
        [self scheduleBlock:^(CCTimer *timer) {
            [nodeB.physicsBody applyImpulse:ccp(-100, 600)];
        } delay:0.1f];
    }
    return YES;
}
-(void) ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair Player:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    [self.delegate transHpDecrease:2];
    
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair slFire:(CCNode *)nodeA Stone:(CCNode *)nodeB
{
    
    if (bRHP <2) {
  
    bRHP = bRHP +1;
        CCLOG(@"brhp = %d",bRHP);

    }
    return YES;
}

-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair slFire:(CCNode *)nodeA Stone:(CCNode *)nodeB
{
    if (bRHP<2) {
        [nodeB.physicsBody applyImpulse:ccp(500 , 200)];
    }
    if (bRHP == 2) {
        [nodeB removeFromParent];
        bRHP = 0;
    }
    CCLOG(@"separate brhp = %d",bRHP);
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair slFire:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    [nodeB removeFromParent];
    return YES;
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair SkillFire:(CCNode *)nodeA enemy:(CCNode *)nodeB
{
    [nodeB removeFromParent];
    return YES;
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
