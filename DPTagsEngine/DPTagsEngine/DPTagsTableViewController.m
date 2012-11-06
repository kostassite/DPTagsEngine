//
//  DPTagsTableViewController.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagsTableViewController.h"
#import "DPTag.h"
#import "DPTagTextField.h"
#import "DPTagsEngine.h"
#import "MyTagsEngine.h"

@interface DPTagsTableViewController (){
	NSArray *tagsArray;
	DPTagsEngine *tagsEngine;
}

@end

@implementation DPTagsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	tagsEngine=[[MyTagsEngine alloc]init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tagsArray count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell ;
    if (!cell) {
		cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
    if (indexPath.row==0) {
		[cell.textLabel setText:@"Add new Tag"];
	}else{
		DPTag *current=[tagsArray objectAtIndex:indexPath.row];
		[cell.textLabel setText:current.text];
    }
	
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row==0) {
		return NO;
	}

    return YES;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.row==0) {
		UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
		DPTagTextField *tagTextField=[[DPTagTextField alloc]init];
		[tagTextField setTagsEngine:tagsEngine];
		[tagTextField setBorderStyle:UITextBorderStyleRoundedRect];
		[tagTextField setFrame:CGRectMake(30, 10, 250, 40)];
		[cell.contentView addSubview:tagTextField];
		[cell.textLabel setText:@""];
	}
}

@end
