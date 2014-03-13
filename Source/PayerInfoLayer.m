//
//  PayerInfoLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "PayerInfoLayer.h"

@implementation PayerInfoLayer
-(void) didLoadFromCCB
{
    self.userInteractionEnabled  = TRUE;
    
}

-(void) isPopPlayerInfoScene:(id)sender
{
    [self.delegate popPlayerInfo];
}
@end
