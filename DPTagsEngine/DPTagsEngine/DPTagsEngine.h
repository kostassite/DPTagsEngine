//
//  DPTagsEngine.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPTagsEngineDelegate <NSObject>

-(void)textRemoved:(NSString*)text;
-(void)textAdded:(NSString*)text;
-(void)tagsArrayUpdatedTo:(NSArray*)newArray;

@end

@interface DPTagsEngine : NSObject<UITextFieldDelegate>{
	NSArray *allTags;
}

-(void)loadDatabase;


@property (nonatomic,weak) id<DPTagsEngineDelegate> delegate;

@end
