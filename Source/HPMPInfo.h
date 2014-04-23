//
//  HPMPInfo.h
//  NUTheNord
//
//  Created by Sid on 2014/4/12.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface HPMPInfo : CCNode
{
    CCNode * HPLine;
    CCLabelTTF * HPNum;
    CCNode * MPLine;
    CCLabelTTF * MPNum;
}
@property (nonatomic,strong) CCNode * currentLevel;
@property (nonatomic) int HP;
@property (nonatomic) int MP;
-(void) hpDecrease :(int) damage;
-(void) hpIncrease :(int) plus;
-(void) mpDecrease :(int) count;
-(void) mpIncrease :(int) destance;
-(void) popLevelScene;

@end