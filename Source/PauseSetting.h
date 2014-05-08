//
//  PauseSetting.h
//  NUTheNord
//
//  Created by Sid on 2014/5/4.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//
@protocol PauseSettingDelegate <NSObject>

-(void) closePause;
-(void) popLevelScene;
@end
#import "CCNode.h"
#import "CCAlertView.h"
@interface PauseSetting : CCNode <CCAlertviewDelegate>
{
    CCButton * _close;
    CCButton * _left;
}
@property (nonatomic,weak) id<PauseSettingDelegate> delegate;
@end
