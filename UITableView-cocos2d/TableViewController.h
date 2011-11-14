//
//  MyUITableView.h
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 14.11.11.
//  Copyright 2011 Flexnor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController {
    BOOL isGrouped;
    BOOL useAccessory;
    BOOL useThumbnail;
}
    
-(void) addAccessory;
-(void) addThumbnail;
@end
