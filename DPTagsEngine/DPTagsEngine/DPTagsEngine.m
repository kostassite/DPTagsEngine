//
//  DPTagsEngine.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagsEngine.h"
#import "DPTag.h"

@interface DPTagsEngine (){
	NSMutableArray *oldFoundTags;
	NSMutableArray *foundTags;
}

@end

@implementation DPTagsEngine
@synthesize searchString=_searchString;
@synthesize delegate;

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

-(void)searchForString{
	if (foundTags) {
		oldFoundTags=foundTags;
	}
	
	foundTags=nil;
	foundTags=[[NSMutableArray alloc]init];
	for (DPTag *tag in allTags) {
		if ([tag.text rangeOfString:_searchString].location !=NSNotFound ) {
			if (foundTags) {
				[foundTags addObject:tag.text];
				if (self.delegate && [self.delegate respondsToSelector:@selector(textAdded:)]) {
					[self.delegate textAdded:tag.text];
				}
			}
		}
	}
}

-(void)deleteFromOldFoundTags{
	NSString *newString=[_searchString copy];
	for (NSString *oldText in oldFoundTags) {
		if ([oldText rangeOfString:newString].location==NSNotFound) {
			if (self.delegate && [self.delegate respondsToSelector:@selector(textRemoved:)]) {
				[self.delegate textRemoved:oldText];
			}
		}
	}
}

@end
