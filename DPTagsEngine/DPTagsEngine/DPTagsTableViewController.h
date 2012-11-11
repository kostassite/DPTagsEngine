//
//  DPTagsTableViewController.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPTagsTableViewController;

@protocol DPTagsTableViewControllerDelegate <NSObject>

@optional
-(void)tagsTableVC:(DPTagsTableViewController*)tagsTableVC willDisappearWithTagsArray:(NSArray*)tagsArray;
-(void)tagsTableVC:(DPTagsTableViewController*)tagsTableVC addedNewTagText:(NSString*)text;
-(void)tagsTableVC:(DPTagsTableViewController*)tagsTableVC removedTagText:(NSString*)text;
-(void)tagsTableVC:(DPTagsTableViewController*)tagsTableVC updatedWithNewTagsArray:(NSArray*)tagsArray;

@end


@interface DPTagsTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *tagsArray;
@property (nonatomic,weak) id<DPTagsTableViewControllerDelegate> delegate;

@end
