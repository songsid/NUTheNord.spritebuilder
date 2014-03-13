//
//  SkipIntoLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "SkipIntoLayer.h"

@implementation SkipIntoLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    
}
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self.delegate skipInto];
    CCLOG(@"skip");
}
@end
