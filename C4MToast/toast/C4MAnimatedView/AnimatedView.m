//
//  AnimatedView.m
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import "AnimatedView.h"

@implementation AnimatedView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if(mColorBackGround == nil)
    {
        mColorBackGround = [self.backgroundColor retain];
    }
    
    
    self.backgroundColor = [UIColor clearColor];
    if(self.tag == 0)
    {
        self.frame = CGRectMake(self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height);  
    }
    else if(self.tag == 1)
    {
        self.frame = CGRectMake(-self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height);
    }
    else if(self.tag == 2)
    {
        self.frame = CGRectMake(0,  self.frame.size.height,  self.frame.size.width,  self.frame.size.height);
    }
    else if(self.tag == 3)
    {
        self.frame = CGRectMake(0, - self.frame.size.height,  self.frame.size.width,  self.frame.size.height);
    }
    else
    {
        self.frame = CGRectMake(self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height);
    }
    
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
     { self.frame = CGRectMake(0, 0,  self.frame.size.width,  self.frame.size.height); }completion:^(BOOL finished)
    {
    
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionNone animations:^
     { self.backgroundColor = mColorBackGround;  }completion:^(BOOL finished){}];
    
    
    }];
    
    
    
}



- (void)removeFromSuperview
{
    if(self.tag == 9)
    {
        [super removeFromSuperview];
    }
    else
    {
        [UIView transitionWithView:self duration:0.05 options:UIViewAnimationOptionTransitionNone animations:^
         { self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){
             if(finished)
             {
                 if(self.tag == 0)
                 {
                     [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
                      { self.frame = CGRectMake(self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height); self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){ if(finished) [super removeFromSuperview];}];
                 }
                 else if(self.tag == 1)
                 {
                     [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
                      { self.frame = CGRectMake(-self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height); self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){ if(finished) [super removeFromSuperview];}];
                 }
                 else if(self.tag == 2)
                 {
                     [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
                      { self.frame = CGRectMake(0,  self.frame.size.height,  self.frame.size.width,  self.frame.size.height); self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){ if(finished) [super removeFromSuperview];}];
                 }
                 else if(self.tag == 3)
                 {
                     [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
                      { self.frame = CGRectMake(0, - self.frame.size.height,  self.frame.size.width,  self.frame.size.height); self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){ if(finished) [super removeFromSuperview];}];
                 }
                 else
                 {
                     [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^
                      { self.frame = CGRectMake(self.frame.size.width, 0,  self.frame.size.width,  self.frame.size.height); self.backgroundColor = [UIColor clearColor];}completion:^(BOOL finished){ if(finished) [super removeFromSuperview];}];
                 }
             }
             
         }];
    }
}

- (void) addCloseAnimation
{
    if(self.tag == 0)
    {
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(backToMenu)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipeRight];
        [swipeRight release];
    }
    else
    {
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(backToMenu)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipeLeft];
        [swipeLeft release];
    }
}
-(IBAction)backToMenu
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didMenuDisplay" object:nil];
    [self removeFromSuperview];
}


@end
