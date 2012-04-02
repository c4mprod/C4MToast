//
//  DetailViewController.h
//  toast
//
//  Created by Prigent roudaut on 05/05/11.
//  Copyright 2011 c4mprod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
