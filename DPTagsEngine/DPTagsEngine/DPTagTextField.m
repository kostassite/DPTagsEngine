//
//  DPTagTextField.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagTextField.h"

@interface DPTagTextField (){
	UIView*	accessoryView;
}

@end

@implementation DPTagTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        // Initialization code
    }
    return self;
}


-(UIView*)inputAccessoryView{
	accessoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
	[accessoryView setBackgroundColor:[UIColor redColor]];
	return accessoryView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
