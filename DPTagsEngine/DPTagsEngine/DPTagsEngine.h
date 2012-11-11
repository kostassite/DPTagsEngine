//
//  DPTagsEngine.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPTag.h"

@protocol DPTagsEngineDelegate <NSObject>

@optional
-(void)textRemoved:(NSString*)text;
-(void)textAdded:(NSString*)text;
-(void)tagsArrayUpdatedTo:(NSArray*)newArray;
-(void)textCleared;
-(void)textSelected:(NSString*)text;
-(void)textAfterReturnedPressed:(NSString*)text;

@end

@interface DPTagsEngine : NSObject<UITextFieldDelegate>{
	NSArray *allTags;
}

-(void)loadDatabase;


@property (nonatomic,weak) id<DPTagsEngineDelegate> delegate;

@end
