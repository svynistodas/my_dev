//
//  DisplayViewController.h
//  PhotoViewer
//
//  Created by Arnoldas on 6/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "InfoViewController.h"

@interface DisplayViewController : UIViewController

@property (nonatomic, strong) Photo *currentPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;


@end
