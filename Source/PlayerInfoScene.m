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
            _spriteLabel.string = [NSString stringWithFormat:@"樓下念一念出師表"];
            CCLOG(@"case1");
            break;
        case 1:
            _spriteLabel.string = [NSString stringWithFormat:@"臣亮言：先帝創業未半，而中道崩殂。\n今天下三分，益州疲弊，此誠危急存亡之秋也。\n然侍衛之臣，不懈於內；忠志之士，忘身於外者，\n蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，\n以光先帝遺德，恢弘志士之氣；不宜妄自菲薄，\n引喻失義，以塞忠諫之路也。宮中府中，俱為體，\n陟罰臧否，不宜異同。若有作姦犯科，及為忠善者，\n宜付有司，論其刑賞，以昭陛下平明之治，不宜篇私，\n使內外異法也。侍中、侍郎郭攸之、費褘、董允等，\n此皆良實，志慮忠純，是以先帝簡拔以遺陛下。\n愚以為宮中之事，事無大小，悉以咨之，然後施行，\n必能裨補闕漏，有所廣益。將軍向寵，性行淑均，\n曉暢軍事，試用於昔日，先帝稱之曰「能」，是以眾議舉寵為督。\n愚以為營中之事，悉以咨之，必能使行陣和睦，優劣得所。\n親賢臣，遠小人，此先漢所以興隆也；親小人，遠賢臣，\n此後漢所以傾頹也。\n先帝在時，每與臣論此事，未嘗不歎息痛恨於桓、靈也。\n侍中、尚書、長史；參軍，此悉貞良死節之臣也，\n願陛下親之信之，則漢室之隆，可計日而待也。\n"];
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
