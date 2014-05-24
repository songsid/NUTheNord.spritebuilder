//
//  PlayerInfoScene.h
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//


#import "PlayerInfoLayer.h"
#import "CCNode.h"
#import "SkipIntoLayer.h"
#import "SpriteSaber.h"
#import "SpriteArcher.h"
#import "SpriteLancer.h"
@interface PlayerInfoScene : CCNode <CCPhysicsCollisionDelegate,PlayerInfoLayerDelegate,SaberDelegate,ArcherDelegate,LancerDelegate>
{

    CCScrollView * _playerInfoScrollView;
    CCScrollView * _spriteScrollView;
    CCLabelTTF * _spriteLabel;
    CCPhysicsNode * _physicsNode;
    PlayerInfoLayer * playerInfo;
    SpriteSaber * spriteSaber;
    SpriteArcher * spriteArcher;
    SpriteLancer * spriteLancer;
    CCSprite * _spriteSupVa;
    CCSprite * _spriteSupSieg;
    CCSprite * _spriteSupLain;
    
    BOOL spriteOn;
    BOOL supOn;
    BOOL addInfo;
    id moveSprite;
    id rotatedSprite;
    id moveSprite2;
    id rotatedSprite2;
    id moveSup;
    id rotatedSup;
    id plusSprite;
    id plusSup;
    int lastSprite;
}

@property (nonatomic,strong) NSMutableArray * arraySprite;
@property (nonatomic,strong) NSMutableArray * arraySup;
-(void) playerInfoLayerRemove;
-(void) playerInfoLayerAdd :(id)sprite;
@end
