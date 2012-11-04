//
//  DPTag.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/5/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTag.h"

@implementation DPTag
@synthesize text,count;

+(DPTag*)tagWithText:(NSString*)t andCount:(NSInteger)c{
	DPTag *new=[[DPTag alloc]init];
	new.text=t;
	new.count=c;
	return new;
}

-(DPTag*)copy{
	DPTag *copied=[[DPTag alloc]init];
	copied.text=[self.text copy];
	copied.count=self.count;
	return copied;
}
@end
