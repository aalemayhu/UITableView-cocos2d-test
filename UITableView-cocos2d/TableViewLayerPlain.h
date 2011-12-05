//
//  TableViewLayer.h
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 14.11.11.
//  Copyright 2011 Flexnor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class TableViewController;
@interface TableViewLayerPlain : CCLayer {
    TableViewController *tableViewController;
    
    CCLabelTTF *labeTwo, *labelThree;
}

@end
