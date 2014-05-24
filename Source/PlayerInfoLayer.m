//
//  PlayerInfoLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PlayerInfoLayer.h"

@implementation PlayerInfoLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = YES;
    _bgButton.label.opacity = 0.5;
}

-(void) update:(CCTime)delta
{
    
}
-(void) leftPlayerInfo:(id)sender
{
    [self.delegate playerInfoLayerRemove];
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
}
@end
