//
//  DPTagsEngine.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/4/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPTagsEngine : NSObject{
	NSArray *allTags;
}

-(void)loadDatabase;

@end
