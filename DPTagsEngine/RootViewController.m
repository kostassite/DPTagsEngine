//
//  RootViewController.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "RootViewController.h"
#import "DPTagTextField.h"
#import "MyTagsEngine.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet DPTagTextField *tagsTextField;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	MyTagsEngine *tagsEngine=[[MyTagsEngine alloc]init];
	[self.tagsTextField setTagsEngine:tagsEngine];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
