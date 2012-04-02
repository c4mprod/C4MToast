//
//  C4MToast.h
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimatedView.h"

@interface C4MToast : NSObject
{
    NSInteger                         mDuration;
    IBOutlet    UILabel*              mText;
    IBOutlet    AnimatedView*         mC4MToast;
}
- (id)initWithText:(NSString*) _Text andDuration:(NSInteger) _Duration andNibName:(NSString*) _NibName;
+ (C4MToast *)makeText:(NSString*) _Text andDuration:(NSInteger) _Duration;
+ (C4MToast *)makeText:(NSString*) _Text andDuration:(NSInteger) _Duration andNibName:(NSString*) _NibName;
-(void) show;
@end
