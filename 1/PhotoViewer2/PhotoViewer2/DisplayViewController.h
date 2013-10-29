//
//  DisplayViewController.h
//  PhotoViewer2
//
//  Created by Arnoldas on 6/12/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "InfoViewController.h"

@interface DisplayViewController : UIViewController

@property (nonatomic, strong) Photo *currentPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end
