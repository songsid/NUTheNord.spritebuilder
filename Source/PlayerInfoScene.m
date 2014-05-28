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
    if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad){ self.scale = 1.07;}
    _spriteScrollView.anchorPoint = ccp(0, 0);
    _spriteScrollView.position = ccp(0, 0);
    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score"];
    NSLog(@"Welcome! %@\n Your current score is %d.", user, score);
    _spriteLabel.anchorPoint = ccp(0,1);
    _spriteLabel.position =ccp(140, 301);
    _spriteLabel.string = [NSString stringWithFormat:@"fdfsaweraef"];


 
    spriteSaber = (SpriteSaber * )[CCBReader load:@"SpriteSaber"];
    spriteSaber.position = ccp(45, 64);
    spriteSaber.physicsBody.collisionType = @"Sprite";
    spriteSaber.delegate  = self;
    [self addChild:spriteSaber z:0];
    [self.arraySprite addObject:spriteSaber];
    
    spriteLancer = (SpriteSaber * )[CCBReader load:@"SpriteLancer"];
    spriteLancer.position = ccp(145, 64);
    spriteLancer.physicsBody.collisionType = @"Sprite";
    spriteLancer.delegate = self;
    [self addChild:spriteLancer z:0];
    [self.arraySprite addObject:spriteLancer];
    
    spriteArcher = (SpriteSaber * )[CCBReader load:@"SpriteArcher"];
    spriteArcher.position = ccp(200, 64);
    spriteArcher.physicsBody.collisionType =@"Sprite";
    spriteArcher.delegate =  self;
    [self addChild:spriteArcher z:0];
    [self.arraySprite addObject:spriteArcher];
    
    
    spriteSupLain = (SpriteSaber *)[CCBReader load:@"SpriteSupportLainDau"];
    spriteSupLain.position = ccp(402, 64);
    spriteSupLain.delegate = self;
    [self addChild:spriteSupLain];
    [self.arraySup addObject:spriteSupLain];
    
    spriteSupSieg = (SpriteSaber *)[CCBReader load:@"SpriteSupportSiegfried"];
    spriteSupSieg.position = ccp(350, 64);
    spriteSupSieg.delegate = self;
    [self addChild:spriteSupSieg];
    [self.arraySup addObject:spriteSupSieg];
    
    spriteSupVa = (SpriteSaber * )[CCBReader load:@"SpriteSupportVaina"];
    spriteSupVa.position = ccp(300, 64);
    spriteSupVa.delegate = self;
    [self addChild:spriteSupVa];
    [self.arraySup addObject:spriteSupVa];
    
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
        
        if (((sprite.position.y+sprite.contentSize.height * .3 > 208) && (sprite.position.y-sprite.contentSize.height * .3 < 208) && (sprite.position.x+sprite.contentSize.width * .3 > 116) && (sprite.position.x-sprite.contentSize.width * .3 < 116))) {
            CCLOG(@"got!!");
            spriteOn = YES;
            [sprite stopAllActions];
            lastSprite = [[NSUserDefaults standardUserDefaults]integerForKey:@"Spirit"];
            if([sprite isEqual:spriteSaber])[[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"Spirit"];
            if ([sprite isEqual:spriteLancer])[[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Spirit"];
            if ([sprite isEqual:spriteArcher])[[NSUserDefaults standardUserDefaults]setInteger:2 forKey:@"Spirit"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
        if (spriteOn) {
            spriteOn = NO;
            switch (lastSprite) {
                case 0:
                {
                    spriteSaber.position = ccp(242, 231);
                    id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(45, 64)];
                    [spriteSaber runAction:mov];
                }
                    break;
                case 1:
                {
                    spriteLancer.position = ccp(242, 231);
                    id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(145, 64)];
                    [spriteLancer runAction:mov];
                }
                    break;
                case 2:
                {
                    spriteArcher.position = ccp(242, 231);
                    id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(200, 64)];
                    [spriteArcher runAction:mov];
                }
                    break;
                default:
                    break;
            }
        }

    }
 }
 
    switch ([[NSUserDefaults standardUserDefaults]integerForKey:@"Spirit"]) {
        case 0:
            spriteSaber.position = ccp(116, 208);
            break;
        case 1:
            spriteLancer.position = ccp(116, 208);
            break;
        case 2:
            spriteArcher.position  = ccp(116, 208);
            break;
        default:
            break;
    }
    if (spriteSaber.position.x <49 && spriteSaber.position.x >41 && spriteSaber.position.y <67 && spriteSaber.position.y >61) {
        [spriteSaber stopAllActions];
    }
    if (spriteLancer.position.x <148 && spriteLancer.position.x >142 && spriteLancer.position.y <67 && spriteLancer.position.y >61) {
        [spriteLancer stopAllActions];
    }
    if (spriteArcher.position.x <203 && spriteArcher.position.x >197 && spriteArcher.position.y <67 && spriteArcher.position.y >62) {
        [spriteArcher stopAllActions];
    }

    if (!addInfo) {
        for (CCNode * sprite in _arraySup) {
            
            if (((sprite.position.y+sprite.contentSize.height * .3 > 208) && (sprite.position.y-sprite.contentSize.height * .3 < 208) && (sprite.position.x+sprite.contentSize.width * .3 > 358) && (sprite.position.x-sprite.contentSize.width * .3 < 358))) {
                CCLOG(@"got!!");
                supOn = YES;
                [sprite stopAllActions];


                lastSup = [[NSUserDefaults standardUserDefaults]integerForKey:@"Sup"];
                if([sprite isEqual:spriteSupLain])[[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"Sup"];
                if ([sprite isEqual:spriteSupSieg])[[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Sup"];
                if ([sprite isEqual:spriteSupVa])[[NSUserDefaults standardUserDefaults]setInteger:2 forKey:@"Sup"];
                [[NSUserDefaults standardUserDefaults] synchronize];

                
            }
            if (supOn) {
                supOn = NO;
                switch (lastSup) {
                    case 0:{
                        spriteSupLain.position = ccp(242, 231);
                        id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(402, 64)];
                        [spriteSupLain runAction:mov];

                        break;
                    }
                    case 1:
                    {
                        spriteSupSieg.position = ccp(242, 231);
                        id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(350, 64)];
                        [spriteSupSieg runAction:mov];
                  }
                        break;
                    case 2:
                    {
                        spriteSupVa.position = ccp(242, 231);
                        id mov  = [CCActionMoveTo actionWithDuration:3.0f position:ccp(300, 64)];
                        [spriteSupVa runAction:mov];
                    }
                        break;
                        
                    default:
                        break;
                }
            }

        }
    }
    switch ([[NSUserDefaults standardUserDefaults]integerForKey:@"Sup"]) {
        case 0:
            spriteSupLain.position = ccp(358, 208);
            break;
        case 1:
            spriteSupSieg.position = ccp(358, 208);
            break;
        case 2:
            spriteSupVa.position  = ccp(358, 208);
            break;
        default:
            break;
    }
    if (spriteSupSieg.position.x <356 && spriteSupSieg.position.x >347 && spriteSupSieg.position.y <67 && spriteSupSieg.position.y >62) {
        [spriteSupSieg stopAllActions];
        CCLOG(@"stop sieg");
    }
    if (spriteSupVa.position.x <305 && spriteSupVa.position.x >296 && spriteSupVa.position.y <67 && spriteSupVa.position.y >62) {
        [spriteSupVa stopAllActions];
        CCLOG(@"stop va");
    }
    if (spriteSupLain.position.x <405 && spriteSupLain.position.x >399 && spriteSupLain.position.y <67 && spriteSupLain.position.y >62) {
        [spriteSupLain stopAllActions];
        CCLOG(@"stop lain");
    }

}
-(void) playerInfoLayerRemove
{
    CCLOG(@"removeInfo");
    [self removeChild:playerInfo];
    addInfo = NO;


}
-(void) playerInfoLayerAdd :(id)sprite
{
    if ([sprite isEqualToString:@"0"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
        [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
    if ([sprite isEqualToString:@"1"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
        [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
    if ([sprite isEqualToString:@"2"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
            [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
    if ([sprite isEqualToString:@"10"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
  
                [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
    if ([sprite isEqualToString:@"11"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
                [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
    if ([sprite isEqualToString:@"12"]) {
        CCLOG(@"ADD PlayerInfoLayer!!");
        playerInfo = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
        playerInfo.position = ccp(0,0);
        playerInfo.delegate = self;
                [playerInfo setLabel:sprite];
        [self addChild:playerInfo z:100];
        addInfo = YES;
    }
}



@end
