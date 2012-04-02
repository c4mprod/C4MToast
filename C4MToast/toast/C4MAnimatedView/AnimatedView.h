//
//  AnimatedView.h
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AnimatedView : UIView
{
    UIColor* mColorBackGround;
}

- (void)addCloseAnimation;
- (IBAction)backToMenu;
@end
