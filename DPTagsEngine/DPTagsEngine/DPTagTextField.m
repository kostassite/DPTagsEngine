//
//  DPTagTextField.m
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPTagTextField.h"
#import "DPTagsEngine.h"
#import "DPTag.h"

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
	accessoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
	[accessoryView setBackgroundColor:[UIColor redColor]];
	return accessoryView;
}

-(UITextFieldViewMode)clearButtonMode{
	return UITextFieldViewModeWhileEditing;
}

#pragma mark - Button Creation

-(void)clearAccessoryView{
	for (UIView *subview in [accessoryView subviews]) {
		[subview removeFromSuperview];
	}
}

-(void)createButtonsFromArray:(NSArray*)tagsArray{
	
	[self clearAccessoryView];
	
	UIButton *previousBtn;
	for (DPTag *tag in tagsArray) {
		UIButton *newBtn=[self buttonForTag:tag];
		if (!previousBtn) {
			[newBtn setFrame:(CGRect){{5,5},newBtn.frame.size}];
		}else{
			NSInteger newWidth=previousBtn.frame.origin.x+previousBtn.frame.size.width+10+newBtn.frame.size.width+5;
			if (newWidth <accessoryView.frame.size.width) {
				CGRect oldFrame=previousBtn.frame;
				oldFrame.origin.x=previousBtn.frame.origin.x+previousBtn.frame.size.width+10;
				oldFrame.size=newBtn.frame.size;
				[newBtn setFrame:oldFrame];
			}else{
				CGRect oldFrame=CGRectZero;
				oldFrame.origin.y=previousBtn.frame.origin.y+25;
				oldFrame.origin.x=5;
				oldFrame.size=newBtn.frame.size;
				[newBtn setFrame:oldFrame];
			}
		}
		[accessoryView addSubview:newBtn];
		previousBtn=newBtn;
	}
	
}

-(UIButton*)buttonForTag:(DPTag*)tag{
	UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	UIFont *font=[UIFont systemFontOfSize:10];
	[btn.titleLabel setFont:font];
	CGSize textSize=[tag.text sizeWithFont:font constrainedToSize:CGSizeMake(320, 20) lineBreakMode:NSLineBreakByTruncatingTail];
	[btn setFrame:CGRectMake(0, 0, textSize.width+10, 20)];
	[btn setTitle:tag.text forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(tagPressed:) forControlEvents:UIControlEventTouchUpInside];
	return btn;
}

#pragma mark - Button/Tags Actions

-(void)tagPressed:(UIButton*)sender{
	self.text=[sender titleForState:UIControlStateNormal];
	[self endEditing:YES];
}

#pragma mark - DPTagsEngineDelegate

-(void)tagsArrayUpdatedTo:(NSArray *)newArray{
	[self createButtonsFromArray:newArray];
}

-(void)textCleared{
	[self clearAccessoryView];
}

@end
