//
//  HelloWorldLayer.m
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 14.11.11.
//  Copyright Flexnor 2011. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "TableViewLayerPlain.h"
#import "TableViewLayerGrouped.h"
#import "TableViewController.h"

@interface HelloWorldLayer(openTableVC)
-(void) openTableViewPlain;
-(void) openTableViewGrouped;
@end

@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init
{
	if( (self=[super init])) {
        
        CCLabelTTF *labelOne = [CCLabelTTF labelWithString:@"UITableView Plain" fontName:@"Arial" fontSize:40];
        CCLabelTTF *labelTwo = [CCLabelTTF labelWithString:@"UITableView Grouped" fontName:@"Arial" fontSize:40];
        CCMenuItemLabel *itemOne = [CCMenuItemLabel itemWithLabel:labelOne target:self selector:@selector(openTableViewPlain)];
        CCMenuItemLabel *itemTwo = [CCMenuItemLabel itemWithLabel:labelTwo target:self selector:@selector(openTableViewGrouped)];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCMenu *menu = [CCMenu menuWithItems:itemOne, itemTwo, nil];
        menu.position = ccp(winSize.width/2, winSize.height/2);
        [menu alignItemsVertically];
        [self addChild:menu];
	}
	return self;
}

#pragma mark -
#pragma mark Open Table Methods

-(void) openTableViewPlain{
    
    CCScene *newScene = [CCTransitionSlideInL transitionWithDuration:.3 
                                                               scene:[TableViewLayerPlain node]];
    
    [[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) openTableViewGrouped{
    
    CCScene *newScene = [CCTransitionSlideInL transitionWithDuration:.3 
                                                               scene:[TableViewLayerGrouped node]];
    
    [[CCDirector sharedDirector] replaceScene:newScene];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
