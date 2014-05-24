//
//  SpriteArcher.m
//  NUTheNord
//
//  Created by Sid on 2014/5/23.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "SpriteArcher.h"

@implementation SpriteArcher
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = YES;
    
    CCLOG(@"self.position = %f,%f",self.position.x,self.position.y);
    selfLocation = self.position;
    
}
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    touchBeg = YES;
    touchMov = YES;
    self.physicsBody.affectedByGravity = NO;
    CCLOG(@"touch sprite");
}
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    // we want to know the location of our touch in this scene
    CGPoint touchLocation = [touch locationInNode:self.parent];
    self.position = touchLocation;
    CCLOG(@"self.position = %f,%f",self.position.x,self.position.y);
    
}

-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"te");
    self.physicsBody.affectedByGravity = YES;
    touchBeg = NO;
    touchMov = NO;
}
-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"tc");
    self.physicsBody.affectedByGravity = YES;
    touchBeg = NO;
    touchMov = NO;
}
-(void) update:(CCTime)delta
{
    if (touchBeg && touchMov &&( (fabsf(self.position.x -selfLocation.x))<50*delta)&& (fabsf(self.position.y -selfLocation.y))<50*delta) {
        CCLOG(@"highlighte & nomov!");
        buttonTime = buttonTime +delta;
        if (buttonTime > 0.5f) {
            buttonTime = 0;
            CCLOG(@"call info!");
            [self.delegate playerInfoLayerAdd:self.name];
            touchMov = NO;
            touchBeg = NO;
        }
    }else {
        buttonTime =0;
        touchMov = NO;
    }
    selfLocation = self.position;
    
}
@end
