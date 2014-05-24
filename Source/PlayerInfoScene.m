//
//  PlayerInfoScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PlayerInfoScene.h"

@implementation PlayerInfoScene
-(NSMutableArray *) arraySprite
{
    if (!_arraySprite) {
        _arraySprite = [NSMutableArray array];
    }
    return  _arraySprite;
}
-(NSMutableArray *) arraySup
{
    if (!_arraySup) {
        _arraySup = [NSMutableArray array];
    }
    return  _arraySup;
}
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    PlayerInfoLayer * infoLayer = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];

    _playerInfoScrollView.contentNode = infoLayer;
    _playerInfoScrollView.anchorPoint = ccp(0, 0);
    _playerInfoScrollView.position = ccp(0, 0);
    _spriteScrollView.anchorPoint = ccp(0, 0);
    _spriteScrollView.position = ccp(0, 0);
    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score"];
    NSLog(@"Welcome! %@\n Your current score is %d.", user, score);
    _spriteLabel.anchorPoint = ccp(0,1);
    _spriteLabel.position =ccp(140, 301);
    _spriteLabel.string = [NSString stringWithFormat:@"fdfsaweraef"];

    _physicsNode.collisionDelegate = self;
 
    spriteSaber = (SpriteSaber * )[CCBReader load:@"SpriteSaber"];
    spriteSaber.position = ccp(200, 100);
    spriteSaber.physicsBody.collisionType = @"Sprite";
    spriteSaber.delegate  = self;
    [_physicsNode addChild:spriteSaber z:0];
    [self.arraySprite addObject:spriteSaber];
    
    _spriteLancer = (CCSprite * )[CCBReader load:@"SpriteLancer"];
    _spriteLancer.position = ccp(240, 100);
    _spriteLancer.physicsBody.collisionType = @"Sprite";
    [_physicsNode addChild:_spriteLancer z:0];
    [self.arraySprite addObject:_spriteLancer];
    
    _spriteArcher = (CCSprite * )[CCBReader load:@"SpriteArcher"];
    _spriteArcher.position = ccp(280, 100);
    _spriteArcher.physicsBody.collisionType =@"Sprite";
    [_physicsNode addChild:_spriteArcher z:0];
    [self.arraySprite addObject:_spriteArcher];
    
    
    _spriteSupLain = (CCSprite *)[CCBReader load:@"SpriteSupportLainDau"];
    _spriteSupLain.position = ccp(300, 100);
    [_physicsNode addChild:_spriteSupLain];
    
    _spriteSupSieg = (CCSprite *)[CCBReader load:@"SpriteSupportSiegfried"];
    _spriteSupSieg.position = ccp(320, 100);
    [_physicsNode addChild:_spriteSupSieg];
    
    _spriteSupVa = (CCSprite * )[CCBReader load:@"SpriteSupportVaina"];
    _spriteSupVa.position = ccp(320, 110);
    [_physicsNode addChild:_spriteSupVa];
    
    
    ///set Action

    moveSprite = [CCActionMoveTo actionWithDuration:0.3f position:ccp(116, 208)];
    rotatedSprite = [CCActionRotateTo actionWithDuration:0.3f angle:0.0f];
    moveSprite2 = [CCActionMoveTo actionWithDuration:20.0f position:ccp(116, 208)];
//    rotatedSprite = [CCActionRotateTo actionWithDuration:20.0f angle:0.0f];
    plusSprite = [CCActionSequence actions:moveSprite,rotatedSprite,moveSprite2, nil];
}
-(void) popPlayerInfoScene:(id)sender
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2f];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
}
-(void)update:(CCTime)delta
{
 if (!addInfo) {
    for (CCNode * sprite in _arraySprite) {
        
        if (sprite.physicsBody.affectedByGravity && ((sprite.position.y+sprite.contentSize.height * .3 > 208) && (sprite.position.y-sprite.contentSize.height * .3 < 208) && (sprite.position.x+sprite.contentSize.width * .3 > 116) && (sprite.position.x-sprite.contentSize.width * .3 < 116))) {
            CCLOG(@"got!!");
            spriteOn = YES;
            [sprite stopAllActions];
            sprite.physicsBody.affectedByGravity = NO;
            sprite.physicsBody.allowsRotation = NO;
            
           // [sprite runAction:plusSprite];
                if (sprite.position.x == 116 && sprite.position.y == 208) {
                    sprite.position = ccp(116, 208);
                    sprite.rotation = 0;
                    CCLOG(@"in 116");
                }
            lastSprite = [[NSUserDefaults standardUserDefaults]integerForKey:@"Spirit"];
            if([sprite isEqual:spriteSaber])[[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"Spirit"];
            if ([sprite isEqual:_spriteLancer])[[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Spirit"];
            if ([sprite isEqual:_spriteArcher])[[NSUserDefaults standardUserDefaults]setInteger:2 forKey:@"Spirit"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //  sprite.position = ccp(116, 208);
           // sprite.rotation = 0;
            
        }
        if (spriteOn) {
            spriteOn = NO;
            switch (lastSprite) {
                case 0:
                    spriteSaber.position = ccp(242, 231);
                    spriteSaber.physicsBody.affectedByGravity = YES;
                    spriteSaber.physicsBody.allowsRotation = YES;
                    [spriteSaber.physicsBody applyImpulse:ccp(200, 100)];
                    break;
                case 1:
                    _spriteLancer.position = ccp(242, 231);
                    _spriteLancer.physicsBody.affectedByGravity = YES;
                    _spriteLancer.physicsBody.allowsRotation = YES;
                    [_spriteLancer.physicsBody applyImpulse:ccp(200, 100)];
                    break;
                case 2:
                    _spriteArcher.position = ccp(242, 231);
                    _spriteArcher.physicsBody.affectedByGravity = YES;
                    _spriteArcher.physicsBody.allowsRotation = YES;
                    [_spriteArcher.physicsBody applyImpulse:ccp(200, 100)];
                    break;
                default:
                    break;
            }
        }
/*        if (spriteOn && ((sprite.position.y+sprite.contentSize.height * .3 > 208) && (sprite.position.y-sprite.contentSize.height * .3 < 208) && (sprite.position.x+sprite.contentSize.width * .3 > 116) && (sprite.position.x-sprite.contentSize.width * .3 < 116))) {
            sprite.position = ccp(116, 208);
    
        }
        if (!spriteOn && ((sprite.position.y+sprite.contentSize.height * .3 > 208) && (sprite.position.y-sprite.contentSize.height * .3 < 208) && (sprite.position.x+sprite.contentSize.width * .3 > 116) && (sprite.position.x-sprite.contentSize.width * .3 < 116))) {
            sprite.physicsBody.affectedByGravity =YES;
            sprite.physicsBody.allowsRotation = YES;
            [sprite.physicsBody applyImpulse:ccp(400, 100)];
            
        }*/
        /*   CCLOG(@"sprite.position.y+sprite.contentSize.height =%f\n (sprite.position.y-sprite.contentSize.height =%f\n (sprite.position.x+sprite.contentSize.width =%f && (sprite.position.x-sprite.contentSize.width=%f",sprite.position.y+sprite.contentSize.height,sprite.position.y-sprite.contentSize.height,sprite.position.x+sprite.contentSize.width,sprite.position.x-sprite.contentSize.width);
        if (sprite.parent) {
            CCLOG(@"go!");
        }*/
    }
 }
    
 
    switch ([[NSUserDefaults standardUserDefaults]integerForKey:@"Spirit"]) {
        case 0:
            spriteSaber.position = ccp(116, 208);
            spriteSaber.rotation = 0;
 /*           if (spriteOn) {
            _spriteLancer.physicsBody.allowsRotation = YES;
            _spriteLancer.physicsBody.affectedByGravity = YES;
            _spriteArcher.physicsBody.allowsRotation =YES;
            _spriteArcher.physicsBody.affectedByGravity = YES;
            }*/
            break;
        case 1:
            _spriteLancer.position = ccp(116, 208);
            _spriteLancer.rotation = 0;
   /*         if (spriteOn) {
            spriteSaber.physicsBody.allowsRotation = YES;
            spriteSaber.physicsBody.affectedByGravity = YES;
            _spriteArcher.physicsBody.allowsRotation =YES;
            _spriteArcher.physicsBody.affectedByGravity = YES;
            }*/
            break;
        case 2:
            _spriteArcher.position  = ccp(116, 208);
            _spriteArcher.rotation = 0;
  /*          if (spriteOn) {
            spriteSaber.physicsBody.allowsRotation = YES;
            spriteSaber.physicsBody.affectedByGravity = YES;
            _spriteLancer.physicsBody.allowsRotation = YES;
            _spriteLancer.physicsBody.affectedByGravity = YES;
            }*/
            break;
        default:
            break;
    }
   // CCLOG(@"%d", _spriteScrollView.horizontalPage);

    
    /*
    switch (_spriteScrollView.horizontalPage) {
        case 0:
            _spriteLabel.string = [NSString stringWithFormat:@"1"];
         //   CCLOG(@"case1");
            break;
        case 1:
            _spriteLabel.string = [NSString stringWithFormat:@"2"];
          //              CCLOG(@"case2");
            break;
        case 2:
            _spriteLabel.string = [NSString stringWithFormat:@"dsfdfwefwfdf" ];
         //               CCLOG(@"case3");
            break;
        default:
            _spriteLabel.string = [NSString stringWithFormat:@"fasdf"];
            break;
   
     }
      */
        
}
-(void) playerInfoLayerRemove
{
    CCLOG(@"removeInfo");
    [self removeChild:playerInfo];
    addInfo = NO;
    _physicsNode.paused = NO;

}
-(void) playerInfoLayerAdd :(id)sprite
{
    if ([sprite isEqualToString:@"1"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
        _physicsNode.paused = YES;
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
}


-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Sprite:(CCNode *)nodeA Sprite:(CCNode *)nodeB
{
    spriteOn = NO;
    CCLOG(@"sprite sprite!!");
    return YES;
}
@end
