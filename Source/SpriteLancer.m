//
//  SpriteLancer.m
//  NUTheNord
//
//  Created by Sid on 2014/5/22.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "SpriteLancer.h"

@implementation SpriteLancer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = YES;
}
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
        self.physicsBody.affectedByGravity = NO;
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
        self.physicsBody.affectedByGravity = YES;
}
-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.physicsBody.affectedByGravity = YES;
}
@end
