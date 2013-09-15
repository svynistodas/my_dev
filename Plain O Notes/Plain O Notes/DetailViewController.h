//
//  DetailViewController.h
//  Plain O Notes
//
//  Created by Arnoldas on 8/16/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *tView;

@end
