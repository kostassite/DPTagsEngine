//
//  DPTag.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 11/5/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPTag : NSObject

@property (nonatomic,strong) NSString *text;
@property (nonatomic,readwrite) NSInteger count;

+(DPTag*)tagWithText:(NSString*)t andCount:(NSInteger)c;

@end
