//
//  LeagueLayer.m
//  NUTheNord
//
//  Created by Sid on 2014/3/13.
//  Copyright (c) 2014年 Apportable. All rights reserved.
//

#import "LeagueLayer.h"
#define kCCTestMenuItemHeight 30
#define kCCUITestHeaderHeight 44
@implementation LeagueLayer
@synthesize tableView;
-(void) didLoadFromCCB
{
    self.userInteractionEnabled = TRUE;
    tableView = [[CCTableView alloc] init];
    tableView.contentSizeType = CCSizeTypeMake(CCSizeUnitNormalized, CCSizeUnitInsetPoints);
    tableView.contentSize = CGSizeMake(0.3f,90.0f);
    tableView.rowHeight = kCCTestMenuItemHeight;
    tableView.dataSource = self;
    tableView.anchorPoint = ccp(0, 1);
    tableView.position = ccp(243 ,300 );
    _levels = nil;
    [self addChild:tableView z:1];
    CCLOG(@"didloadfromccb");
    
    
}
-(void) setTableView:(CCTableView *)tableViewer
{
//    tableViewer = [[CCTableView alloc] init];
    tableViewer.contentSizeType = CCSizeTypeMake(CCSizeUnitNormalized, CCSizeUnitInsetPoints);
    tableViewer.contentSize = CGSizeMake(0.3f,90.0f);
    tableViewer.rowHeight = kCCTestMenuItemHeight;
    tableViewer.dataSource = self;
    tableViewer.anchorPoint = ccp(0, 1);
    tableViewer.position = ccp(243 ,300 );

    [self addChild:tableViewer z:1];

}
-(void) isSelectAreaOne:(id)sender
{
    [self removeChild:tableView cleanup:YES];
    _levels = [[NSArray alloc]initWithObjects:@"Level_0",@"Level_1",@"Level_2",@"Level_3",@"Level_99", nil];
    tableView = [[CCTableView alloc]init];
    tableView.dataSource = self;
    [self setTableView:tableView];

    //cclog test
    int i;
    for (i=0; i<_levels.count; i++) {
        CCLOG(@"%@",_levels[i]);
    }

}

-(void) isSelectAreaTwo:(id)sender
{
    [self removeChild:tableView cleanup:YES];

    _levels = [[NSArray alloc]initWithObjects:@"Level_4",@"Level_5",@"Level_6",@"Level_7", nil];
    tableView = [[CCTableView alloc]init];
    tableView.dataSource = self;
    [self setTableView:tableView];

    
    //cclog test
    int i;
    for (i=0; i<_levels.count; i++) {
            CCLOG(@"%@",_levels[i]);
    }

}


-(CCTableViewCell *) tableView:(CCTableView *)tableView nodeForRowAtIndex:(NSUInteger)index
{
    
    CCTableViewCell* cell = [CCTableViewCell node];
    cell.userInteractionEnabled = YES;
    cell.contentSizeType = CCSizeTypeMake(CCSizeUnitNormalized, CCSizeUnitUIPoints);
    cell.contentSize = CGSizeMake(1, kSimpleTableViewRowHeight);
    
// Color every other row differently
 
    CCNodeColor* bg;
 
 //   if (index % 2 != 0) bg = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1 green:0 blue:0 alpha:1]];
 //   else
        bg = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.3 green:0.4 blue:0.5 alpha:1]];
 
    
    bg.userInteractionEnabled = YES;
    bg.contentSizeType = CCSizeTypeNormalized;
    bg.contentSize = CGSizeMake(1, 1);
    [cell addChild:bg];
 
// Create a label with the row number
   CCLabelTTF* lbl = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@", [self.levels objectAtIndex:index]] fontName:@"HelveticaNeue" fontSize:18 * [CCDirector sharedDirector].UIScaleFactor];
    lbl.positionType = CCPositionTypeNormalized;
    lbl.position = ccp(0.5f, 0.5f);
    
    [cell addChild:lbl];
    

//Create button

    CCButton * bt = [CCButton buttonWithTitle:[NSString stringWithFormat:@"%d",(int) index] fontName:@"微軟正黑體" fontSize:18 ];
    bt.positionType = CCPositionTypeNormalized;
    bt.position = ccp(0.0f,0.0f);
    bt.anchorPoint = ccp(0, 0);
    [cell addChild:bt];
    
    CCLOG(@"return cell");

    return cell;

}

-(NSUInteger) tableViewNumberOfRows:(CCTableView *)tableView
{
    CCLOG(@"return count: %d",[self.levels count]);
    return [self.levels count];
}

- (float) tableView:(CCTableView*)tableView heightForRowAtIndex:(NSUInteger) index{
    return kCCTestMenuItemHeight;
}



-(void) isPopLeagueScene:(id)sender
{
    [self.delegate popLeagueScene];
    CCLOG(@"popleague!");
}
-(void) isSelectLevel_0:(id)sender
{
    CCNode * send = (CCNode *)[CCBReader load:@"Level_0"];
    [self.delegate pushLevel:send];
    
    
    CCLOG(@"send level0!");
}

-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ([event isEqual:tableView ] ) {
        CCLOG(@"%@",tableView);
    }
    CCLOG(@"touchend");
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"touchBegin");
}


@end
