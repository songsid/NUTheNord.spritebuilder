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
   _levels = Nil;
    [self addChild:tableView z:1];
    CCLOG(@"didloadfromccb");
    
}
-(void) isSelectAreaOne:(id)sender
{

    _levels = [[NSArray alloc]initWithObjects:@"Level_0",@"Level_1",@"Level_2",@"Level_3", nil];
    [self.tableView reloadData];
    int i;
    for (i=0; i<_levels.count; i++) {
        CCLOG(@"%@",_levels[i]);
    }

}

-(void) isSelectAreaTwo:(id)sender
{


    _levels = [[NSArray alloc]initWithObjects:@"Level_4",@"Level_5",@"Level_6",@"Level_7", nil];
    [self.tableView reloadData];
    int i;
    for (i=0; i<_levels.count; i++) {
            CCLOG(@"%@",_levels[i]);
    }

}


-(CCTableViewCell *) tableView:(CCTableView *)tableView nodeForRowAtIndex:(NSUInteger)index
{
    
    CCTableViewCell* cell = [CCTableViewCell node];
    
    cell.contentSizeType = CCSizeTypeMake(CCSizeUnitNormalized, CCSizeUnitUIPoints);
    cell.contentSize = CGSizeMake(1, kSimpleTableViewRowHeight);
    
// Color every other row differently
 
    CCNodeColor* bg;
 
    if (index % 2 != 0) bg = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1 green:0 blue:0 alpha:0.5]];
    else bg = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0 green:1 blue:0 alpha:0.5]];
 
    
    bg.userInteractionEnabled = NO;
    bg.contentSizeType = CCSizeTypeNormalized;
    bg.contentSize = CGSizeMake(1, 1);
    [cell addChild:bg];
 
// Create a label with the row number
   CCLabelTTF* lbl = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@", [self.levels objectAtIndex:index]] fontName:@"HelveticaNeue" fontSize:18 * [CCDirector sharedDirector].UIScaleFactor];
    lbl.positionType = CCPositionTypeNormalized;
    lbl.position = ccp(0.5f, 0.5f);
    
    [cell addChild:lbl];


//Create button

    CCButton * bt = [CCButton buttonWithTitle:[NSString stringWithFormat:@"Button %d \n測試中 \n 測試2",(int) index] fontName:@"微軟正黑體" fontSize:18 ];
    bt.positionType = CCPositionTypeNormalized;
    bt.position = ccp(0.0f,0.0f);
    bt.anchorPoint = ccp(0, 0);
    [cell addChild:bt];

    CCLOG(@"return cell");

    return cell;

}

-(NSUInteger) tableViewNumberOfRows:(CCTableView *)tableView
{
    return [self.levels count];
    CCLOG(@"return count");
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




@end
