//
//  TableViewLayerGrouped.m
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 14.11.11.
//  Copyright 2011 Flexnor. All rights reserved.
//

#import "TableViewLayerGrouped.h"
#import "HelloWorldLayer.h"
#import "TableViewController.h"
#import "com.ccColor3B.h"

@interface TableViewLayerGrouped(nav)
-(void)returnToHelloWorldLayer;
-(void) toggleAccesoryToTable;
-(void) toggleThumbNail;
@end

@implementation TableViewLayerGrouped

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TableViewLayerGrouped *layer = [TableViewLayerGrouped node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        
        CCLabelTTF *labeOne = [CCLabelTTF labelWithString:@"Return" fontName:@"Arial" fontSize:15];
        labeTwo = [CCLabelTTF labelWithString:@"Accessory off" fontName:@"Arial" fontSize:15];
        labelThree = [CCLabelTTF labelWithString:@"Thumbnail off" fontName:@"Arial" fontSize:15];
        
        CCMenuItemLabel *itemOne = [CCMenuItemLabel itemWithLabel:labeOne target:self selector:@selector(returnToHelloWorldLayer)];        
        CCMenuItemLabel *itemTwo = [CCMenuItemLabel itemWithLabel:labeTwo target:self selector:@selector(toggleAccesoryToTable)];
        CCMenuItemLabel *itemThree = [CCMenuItemLabel itemWithLabel:labelThree target:self selector:@selector(toggleThumbNail)];
        
        [itemOne setColor:ccBROWN];
        [itemTwo setColor:ccRED];
        [itemThree setColor:ccRED];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCMenu *menu = [CCMenu menuWithItems:itemOne, itemTwo, itemThree, nil];
        menu.position = ccp(winSize.width - (itemOne.contentSize.width * 2), winSize.height/2);
        [menu alignItemsVertically];
        [self addChild:menu];
        

        
	}
	return self;
}

-(void) onEnterTransitionDidFinish{
    
    tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UIView *view = tableViewController.view;
    
    [[[CCDirector sharedDirector] openGLView] addSubview:view];
}

-(void) toggleAccesoryToTable{
    if([[labeTwo string] isEqualToString:@"Accessory off"]) {
        [labeTwo setString:@"Accessory on"];
        [labeTwo setColor:ccGREEN];
    }else {
        [labeTwo setString:@"Accessory off"];
        [labeTwo setColor:ccRED];
    }
    
    [tableViewController addAccessory];
}

-(void) toggleThumbNail{
    
    if ([[labelThree string] isEqualToString:@"Thumbnail off"]) {
        [labelThree setString:@"Thumbnail on"];
        [labelThree setColor:ccGREEN];
    }else {
        [labelThree setString:@"Thumbnail off"];
        [labelThree setColor:ccRED];
    }
    
    [tableViewController addThumbnail];
}

-(void) returnToHelloWorldLayer{

    [tableViewController.view removeFromSuperview];
    
    CCScene *newScene = [CCTransitionSlideInR transitionWithDuration:.3 
                                                               scene:[HelloWorldLayer node]];
    
    [[CCDirector sharedDirector] replaceScene:newScene];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [tableViewController release];
	[super dealloc];
}

@end
