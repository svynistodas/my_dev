//
//  DetailViewController.h
//  PhotoView3
//
//  Created by Arnoldas on 6/13/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailsLable;
- (IBAction)dismiss:(id)sender;
@property (nonatomic, strong) Photo *currentImage;

@end
