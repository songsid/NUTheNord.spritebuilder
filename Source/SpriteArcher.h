//
//  SpriteArcher.h
//  NUTheNord
//
//  Created by Sid on 2014/5/23.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol ArcherDelegate <NSObject>

-(void) playerInfoLayerAdd :(id)sprite;


@end
#import "CCNode.h"

@interface SpriteArcher : CCSprite
{
    BOOL touchBeg;
    BOOL touchMov;
    CGPoint selfLocation;
    float buttonTime;
}
@property (nonatomic,weak) id<ArcherDelegate> delegate;
@end
