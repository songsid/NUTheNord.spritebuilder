//
//  FirstTimeIntroLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/3/15.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol FirstTimeIntroLayer <NSObject>

-(void) firstTimeIntro;

@end
#import "CCNode.h"

@interface FirstTimeIntroLayer : CCNode
{
    CCLabelTTF * _talk;
    int labelCount;
    BOOL lableSwitch;
}

@property (nonatomic,weak) id <FirstTimeIntroLayer> delegate;
@end
