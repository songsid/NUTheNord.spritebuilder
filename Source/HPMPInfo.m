//
//  HPMPInfo.m
//  NUTheNord
//
//  Created by Sid on 2014/4/12.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "HPMPInfo.h"

@implementation HPMPInfo
@synthesize HP,MP;
-(void) didLoadFromCCB
{
    MP = 0;
    HP = 10;
    MPNum.string = [NSString stringWithFormat:@"%d",MP];
    HPNum.string = [NSString stringWithFormat:@"%d",HP];
    MPLine.scaleX = 0.01f;
    HPLine.scaleX = 1;
    
    }
-(void) hpDecrease :(int) damage
{
    HP = HP-damage;
    HPNum.string = [NSString stringWithFormat:@"%d ",HP ];
    float hpl = (float)HP/10;
    HPLine.scaleX = hpl;
    CCLOG(@"HPDECREASE HERE! HP:%d %f %f",HP,(float) HP/10,HPLine.scaleY);
}
-(void) hpIncrease :(int) plus
{}
-(void) mpDecrease :(int) count
{
    if (MP>0) {
        MP = MP -count;
        MPNum.string = [NSString stringWithFormat:@"%d",MP];
        float mpl = (float)MP/10;
        MPLine.scaleX = mpl;
    }
}
-(void) mpIncrease :(int) destance
{
    if (MP<10) {
    
    MP = MP +destance;
    MPNum.string = [NSString stringWithFormat:@"%d",MP];
    float mpl = (float)MP/10;
    MPLine.scaleX = mpl;
    }
}



////---封印////////////
-(void) popLevelScene{}
////---封印////////////
@end
