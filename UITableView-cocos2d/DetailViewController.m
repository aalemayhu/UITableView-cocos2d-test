//
//  DetailViewController.m
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 15.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController


-(id) initWitTitle:(NSString *)aTitle{
    
    if (self = [super init]) {
        title = [aTitle copy];
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self setTitle:title];
    [[self.navigationController navigationBar] setHidden:NO];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) dealloc{
    
    [title release];
    [super dealloc];
}

@end
