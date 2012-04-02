//
//  C4MToast.m
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import "C4MToast.h"


@implementation C4MToast

//Toast toast = Toast.makeText(getApplicationContext(), getText(R.string.qobuz_sync_json_post_failed_msg), Toast.LENGTH_LONG);
//toast.show();
+ (C4MToast *)makeText:(NSString*) _Text andDuration:(NSInteger) _Duration
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        C4MToast*  lC4MToast= [[[C4MToast alloc] initWithText:_Text andDuration:_Duration andNibName:@"C4MToast"] autorelease];
        return lC4MToast;
    }
    else
    {
        C4MToast*  lC4MToast= [[[C4MToast alloc] initWithText:_Text andDuration:_Duration andNibName:@"C4MToast_iPad"] autorelease];
        return lC4MToast; 
    }
}

+ (C4MToast *)makeText:(NSString*) _Text andDuration:(NSInteger) _Duration andNibName:(NSString*) _NibName
{
    C4MToast*  lC4MToast= [[[C4MToast alloc] initWithText:_Text andDuration:_Duration andNibName:_NibName] autorelease];
	return lC4MToast;
}



- (id)initWithText:(NSString*) _Text andDuration:(NSInteger) _Duration andNibName:(NSString*) _NibName
{
	if ((self = [super init]))
	{
        //self.tag = 1;
        [[NSBundle mainBundle] loadNibNamed:_NibName owner:self options:nil];
        //[self addSubview:mC4MToast];
        
        mDuration = _Duration;
        mText.text = _Text;
        
        
        //CGSize boundingSize = CGSizeMake(mText.frame.size.width, 800);
		//CGSize requiredSize = [mText.text sizeWithFont:[UIFont fontWithName:@"Arial-BoldMT" size:16] constrainedToSize:boundingSize lineBreakMode:UILineBreakModeWordWrap];
		//mText.frame=  CGRectMake(mText.frame.origin.x, mText.frame.origin.y, mText.frame.size.width, requiredSize.height);
	}
	return self;
}

-(void) show
{
    [[UIApplication sharedApplication].keyWindow addSubview:mC4MToast];
    NSTimer * mUpdateBasketTimer = [NSTimer timerWithTimeInterval:mDuration target:self selector:@selector(undisplay:) userInfo:nil repeats:TRUE];
    [[NSRunLoop mainRunLoop] addTimer:mUpdateBasketTimer forMode:NSDefaultRunLoopMode];
}

-(void) undisplay:(NSTimer*) _NSTimer
{
    [_NSTimer invalidate];
    [mC4MToast removeFromSuperview];
}

- (void) dealloc
{
	[super dealloc];
}

@end
