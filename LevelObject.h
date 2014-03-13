//
//  LevelObject.h
//  ProjectPractice
//
//  Created by Sid on 2014/3/5.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface LevelObject : CCNode
{
    CCNode * _physicNode;
    
    CCNode * _player;
    CCNode * _ground;
    
    CCNode * _banana;
    
    BOOL enableJump;
    
}
-(void) didLoadFromCCB;

-(void) update:(CCTime)delta;

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

-(void) isPressedToAttack: (id) sender;

-(void) isPressedToSkill: (id) sender ;

@end
