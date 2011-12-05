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

@interface TableViewLayerGrouped(nav)
-(void)returnToHelloWorldLayer;
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
        
        CCMenuItemFont *itemOne = [CCMenuItemFont itemFromString:@"Return" target:self selector:@selector(returnToHelloWorldLayer)];
        CCMenuItemFont *itemTwo = [CCMenuItemFont itemFromString:@"Accesory" target:self selector:@selector(addAccesoryToTable)];
        CCMenuItemFont *itemThree = [CCMenuItemFont itemFromString:@"Thumbnail" target:self selector:@selector(addThumbNail)];

        CCMenu *menu = [CCMenu menuWithItems:itemOne, itemTwo, itemThree, nil];
        [menu alignItemsVertically];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        menu.position = ccp(winSize.width - itemOne.contentSize.width, winSize.height/2);
        [self addChild:menu];
        

        
	}
	return self;
}

-(void) onEnterTransitionDidFinish{
    
    tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UIView *view = tableViewController.view;
    
    [[[CCDirector sharedDirector] openGLView] addSubview:view];
}

-(void) addAccesoryToTable{
    [tableViewController addAccessory];
}

-(void) addThumbNail{
    [tableViewController addThumbnail];
}

-(void) returnToHelloWorldLayer{
    [tableViewController.view removeFromSuperview];
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer node]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [tableViewController release];
	[super dealloc];
}

@end
