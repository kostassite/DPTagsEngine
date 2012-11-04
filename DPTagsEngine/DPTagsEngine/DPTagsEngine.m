//
//  DPTagsEngine.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagsEngine.h"
#import "DPTag.h"

@implementation DPTagsEngine

-(void)loadDatabase{
	NSMutableArray *temp=[[NSMutableArray alloc]init];
	[temp addObject:[DPTag tagWithText:@"kostas" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"devpro" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"develop" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"prof" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"prof" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"kostis" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athens" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athina" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"kostis" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"optimus" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"aside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"beside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"pro" andCount:2]];
	allTags=[temp copy];
}

@end
