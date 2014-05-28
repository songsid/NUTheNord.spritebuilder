//
//  FirstTimeIntroTwoLayer.h
//  NUTheNord
//
//  Created by Sid on 2014/5/26.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol FirstTimeTwoDelegate <NSObject>

-(void) firstTimeIntro;
@end
#import "CCNode.h"
#import "Dialog.h"

@interface FirstTimeIntroTwoLayer : CCNode <DialogDelegate>
{
    CCSprite * _bg;
    Dialog * diag;
}
@property (nonatomic,weak) id<FirstTimeTwoDelegate> delegate;
-(void) removeDialog;
@end
