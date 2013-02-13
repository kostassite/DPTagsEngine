//
//  DPTagTextField.h
//  DPTagsEngine
//
//  Created by Kostas Antonopoulos on 6/11/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPTagsEngine.h"

@class DPTagsEngine;
@class DPTagTextField;

@protocol DPTagTextFieldDelegate <NSObject>

@optional
-(void)tagTextField:(DPTagTextField*)tagTextField selectedTagText:(NSString*)tagText;
-(void)tagTextField:(DPTagTextField *)tagTextField returnedWithNewTagText:(NSString *)tagText;
@end

@interface DPTagTextField : UITextField<DPTagsEngineDelegate>

-(void)setTagsEngine:(DPTagsEngine*)tagEngine;

@property (nonatomic,weak) id<DPTagTextFieldDelegate> tagDelegate;

@end
