//
//  SpriteLancer.h
//  NUTheNord
//
//  Created by Sid on 2014/5/22.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol LancerDelegate <NSObject>

-(void) playerInfoLayerAdd :(id)sprite;


@end
#import "CCNode.h"

@interface SpriteLancer : CCSprite
{
    BOOL touchBeg;
    BOOL touchMov;
    CGPoint selfLocation;
    float buttonTime;
}
@property (nonatomic,weak) id<LancerDelegate> delegate;
@end
