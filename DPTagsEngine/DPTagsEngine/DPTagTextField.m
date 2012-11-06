//
//  DPTagTextField.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagTextField.h"
#import "DPTagsEngine.h"

@interface DPTagTextField ()<DPTagsEngineDelegate>{
	UIView*	accessoryView;
	DPTagsEngine *tags;
}

@end

@implementation DPTagTextField

-(void)awakeFromNib{
	[self startTagEngine];
	self.delegate=tags;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        // Initialization code
    }
    return self;
}

-(void)startTagEngine{
	tags=[[DPTagsEngine alloc]init];
	[tags loadDatabase];
	[tags setDelegate:self];
}

-(UIView*)inputAccessoryView{
	accessoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
	[accessoryView setBackgroundColor:[UIColor redColor]];
	return accessoryView;
}




#pragma mark - DPTagsEngineDelegate

-(void)tagsArrayUpdatedTo:(NSArray *)newArray{
	NSLog(@"%@",newArray);
}

-(void)textAdded:(NSString *)text{
	NSLog(@"Added -> %@",text);
}

-(void)textRemoved:(NSString *)text{
	NSLog(@"Removed -> %@",text);
}
@end
