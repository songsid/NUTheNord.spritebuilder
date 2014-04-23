//
//  PlayerInfoScene.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PlayerInfoScene.h"

@implementation PlayerInfoScene
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    PlayerInfoLayer * infoLayer = (PlayerInfoLayer *)[CCBReader load:@"PlayerInfoLayer"];
    
    _playerInfoScrollView.contentNode = infoLayer;
    _playerInfoScrollView.anchorPoint = ccp(0, 0);
    _playerInfoScrollView.position = ccp(0, 0);
    _spriteScrollView.anchorPoint = ccp(0, 0);
    _spriteScrollView.position = ccp(0, 0);
    NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score"];
    NSLog(@"Welcome! %@\n Your current score is %d.", user, score);
    _spriteLabel.anchorPoint = ccp(0,1);
    _spriteLabel.position =ccp(140, 301);
    _spriteLabel.string = [NSString stringWithFormat:@"fdfsaweraef"];
    


}
-(void) popPlayerInfoScene:(id)sender
{
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2f];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
}
-(void)update:(CCTime)delta
{
    CCLOG(@"%d", _spriteScrollView.horizontalPage);

    
    
    switch (_spriteScrollView.horizontalPage) {
        case 0:
            _spriteLabel.string = [NSString stringWithFormat:@"1"];
            CCLOG(@"case1");
            break;
        case 1:
            _spriteLabel.string = [NSString stringWithFormat:@"2"];
                        CCLOG(@"case2");
            break;
        case 2:
            _spriteLabel.string = [NSString stringWithFormat:@"dsfdfwefwfdf" ];
                        CCLOG(@"case3");
            break;
        default:
            _spriteLabel.string = [NSString stringWithFormat:@"fasdf"];
            break;
   
     }
        
        
}

-(void) isPlayer : (id) sender
{
    switch (_spriteScrollView.horizontalPage) {
        case 0:
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Spirit"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            break;
            
        case 1:
            [[NSUserDefaults standardUserDefaults] setInteger:1  forKey:@"Spirit"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            break;
            
        case 2:
            [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"Spirit"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            break;
            
        default:
            break;
    }
    CCTransition * trans = [CCTransition transitionFadeWithDuration:0.2f];
    [[CCDirector sharedDirector]popSceneWithTransition:trans];
}


@end
