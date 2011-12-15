//
//  MyUITableView.m
//  UITableView-cocos2d
//
//  Created by Alexander Alemayhu on 14.11.11.
//  Copyright 2011 Flexnor. All rights reserved.
//

#import "DetailViewController.h"
#import "TableViewController.h"
#import "AppDelegate.h"
#import "cocos2d.h"

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        if (style == UITableViewStyleGrouped) isGrouped = YES;
        else isGrouped = NO;
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) addAccessory{
    useAccessory = !useAccessory;
    [[self tableView] reloadData];
}

-(void) addThumbnail {
    useThumbnail = !useThumbnail;
    [[self tableView] reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (isGrouped)
        return 2;
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isGrouped)
        return 3;
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (useAccessory) {
        UITableViewCellAccessoryType a[] = {UITableViewCellAccessoryCheckmark, UITableViewCellAccessoryDetailDisclosureButton, UITableViewCellAccessoryDisclosureIndicator, UITableViewCellAccessoryNone};
        int randomAccesory = rand() % 3;
        
        cell.accessoryType = a[randomAccesory];
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (useThumbnail) {
        UIImage *image = [UIImage imageNamed:@"Icon-Small.png"];
        [[cell imageView] setImage:image];
    }else {
        cell.imageView.image = nil;
    }
    
    
    if (isGrouped) {
        if ( indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = [NSString stringWithFormat:@"section %d", indexPath.row];
                cell.textLabel.textAlignment = UITextAlignmentCenter;
            }
            else if (indexPath.row == 1)
                cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            else if ( indexPath.row == 2)
                cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel.text = [NSString stringWithFormat:@"section %d", indexPath.row+1];
                cell.textLabel.textAlignment = UITextAlignmentCenter;
            }
            else if (indexPath.row == 1)
                cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            else if ( indexPath.row == 2)
                cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
        }
        return cell;
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@"Cell:  %d", indexPath.row];
            break;
        default:
            break;
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title;
    if (isGrouped == NO) {
        title = [NSString stringWithFormat:@"Cell: %d", indexPath.row];       
    }else{
        title = [NSString stringWithFormat:@"Section: %d", indexPath.section];       
    }
    
    // Navigation logic may go here. Create and push another view controller.
    DetailViewController *detailViewController = [[DetailViewController alloc] initWitTitle:title]; 

    //Get access to navigation controller from delegate
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
}

@end
