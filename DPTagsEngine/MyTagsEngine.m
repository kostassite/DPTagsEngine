//
//  MyTagsEngine.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "MyTagsEngine.h"
@implementation MyTagsEngine

-(void)loadDatabase{
	NSMutableArray *temp=[[NSMutableArray alloc]init];
	[temp addObject:[DPTag tagWithText:@"kostas" andCount:1]];
	[temp addObject:[DPTag tagWithText:@"devprow" andCount:40]];
	[temp addObject:[DPTag tagWithText:@"develop" andCount:1]];
	[temp addObject:[DPTag tagWithText:@"prof" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"kostis" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athens" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athina" andCount:2]];
	
	allTags=[temp copy];
}

@end
