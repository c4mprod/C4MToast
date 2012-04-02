//
//  C4MLocalizedLabel.m
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import "C4MLocalizedLabel.h"

@implementation C4MLocalizedLabel


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		self.text	= NSLocalizedString(self.text, self.text);
	}
	return self;
}

@end
