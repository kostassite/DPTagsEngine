//
//  DPTagsEngine.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagsEngine.h"

@interface DPTagsEngine (){
	NSMutableArray *foundTags;
	NSMutableString *searchString;
	
	NSMutableArray *oldStates;
	BOOL restarted;
}

@end

@implementation DPTagsEngine
@synthesize delegate;

-(void)loadDatabase{
	NSMutableArray *temp=[[NSMutableArray alloc]init];
	[temp addObject:[DPTag tagWithText:@"kostas" andCount:1]];
	[temp addObject:[DPTag tagWithText:@"devprow" andCount:40]];
	[temp addObject:[DPTag tagWithText:@"develop" andCount:1]];
	[temp addObject:[DPTag tagWithText:@"prof" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"kostis" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athens" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"athina" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"optimus" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"aside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"beside" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"pro" andCount:5]];
	[temp addObject:[DPTag tagWithText:@"dev" andCount:3]];
	[temp addObject:[DPTag tagWithText:@"devpro" andCount:30]];
	[temp addObject:[DPTag tagWithText:@"antono" andCount:2]];
	[temp addObject:[DPTag tagWithText:@"chalkis" andCount:2]];


	allTags=[temp copy];
}

-(void)searchForBiggerString{
	NSMutableArray *oldTags;

	oldTags=[[NSMutableArray alloc]initWithArray:[oldStates lastObject]];

	foundTags=[[NSMutableArray alloc]initWithArray:oldTags];
	
	for (DPTag *tag in oldTags) {
		if ([tag.text rangeOfString:searchString options:NSCaseInsensitiveSearch].location ==NSNotFound ) {
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
		
		[latestArray sortUsingComparator:^NSComparisonResult(DPTag *obj1, DPTag *obj2) {
			if (obj1.count>obj2.count) {
				return NSOrderedAscending;
			}else if (obj1.count<obj2.count){
				return NSOrderedDescending;
			}else{
				return NSOrderedSame;
			}
		}];
		
		if (self.delegate && [self.delegate respondsToSelector:@selector(tagsArrayUpdatedTo:)]) {
			[self.delegate tagsArrayUpdatedTo:latestArray];
		}
	}
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
	searchString=[[NSMutableString alloc]initWithString:textField.text];
	oldStates=[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:allTags]];
	
	restarted=NO;
	if (![textField.text isEqualToString:@""]) {
		restarted=YES;
	}

}

-(void)textFieldDidEndEditing:(UITextField *)textField{
	if (self.delegate && [self.delegate respondsToSelector:@selector(textSelected:)]) {
		[self.delegate textSelected:textField.text];
	}
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
	
	if (restarted) {
		textField.text=@"";
		searchString=[[NSMutableString alloc]initWithString:@""];
		restarted=NO;
		if ([string isEqualToString:@""]) {
			return YES;
		}
	}
	
	if ([string isEqualToString:@""]) { //mikrine
		[searchString deleteCharactersInRange:NSMakeRange([searchString length]-1, 1)];
		[self searchForSmallerString];
	}else{
		[searchString appendString:string];
		[self searchForBiggerString];
	}

	return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
	searchString=[[NSMutableString alloc]initWithString:@""];
	oldStates=[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:allTags]];
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(textCleared)]) {
		[self.delegate textCleared];
	}
	
	return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(textAfterReturnedPressed:)]) {
        [self.delegate textAfterReturnedPressed:textField.text];
    }
    return YES;
}


@end
