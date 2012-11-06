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
	NSMutableArray *foundTags;
	NSMutableString *searchString;
	
	NSMutableArray *oldStates;
}

@end

@implementation DPTagsEngine
@synthesize delegate;

-(void)loadDatabase{
	NSMutableArray *temp=[[NSMutableArray alloc]init];
	[temp addObject:[DPTag tagWithText:@"kostas" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"devpro" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"develop" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"prof" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"kostis" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athens" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athina" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"optimus" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"aside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"beside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"pro" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"dev" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"devpro" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"antono" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"chalkis" andCount:2]];


	allTags=[temp copy];
	searchString=[[NSMutableString alloc]initWithCapacity:0];
	oldStates=[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:allTags]];
}

-(void)searchForBiggerString{
	NSMutableArray *oldTags;

	oldTags=[[NSMutableArray alloc]initWithArray:[oldStates lastObject]];

	foundTags=[[NSMutableArray alloc]initWithArray:oldTags];
	
	for (DPTag *tag in oldTags) {
		if ([tag.text rangeOfString:searchString].location ==NSNotFound ) {
			[foundTags removeObject:tag];
			if (self.delegate && [self.delegate respondsToSelector:@selector(textAdded:)]) {
				[self.delegate textRemoved:tag.text];
			}
		}
	}
	[oldStates addObject:foundTags];
	[self tagsDatabaseUpdated];
}

-(void)searchForSmallerString{
	[oldStates removeLastObject];
	[self tagsDatabaseUpdated];
}

#pragma mark - Update

-(void)tagsDatabaseUpdated{
	NSMutableArray *latestArray=[[NSMutableArray alloc]initWithArray:[oldStates lastObject]];
	if ([latestArray count]<=30) {
		if (self.delegate && [self.delegate respondsToSelector:@selector(tagsArrayUpdatedTo:)]) {
			[self.delegate tagsArrayUpdatedTo:latestArray];
		}
	}
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
	
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
	if ([string isEqualToString:@""]) { //mikrine
		[searchString deleteCharactersInRange:NSMakeRange([searchString length]-1, 1)];
		[self searchForSmallerString];
	}else{
		[searchString appendString:string];
		[self searchForBiggerString];
	}

	return YES;
}



@end
