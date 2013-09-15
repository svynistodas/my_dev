//
//  ImageViewController.h
//  PhotoView3
//
//  Created by Arnoldas on 6/13/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "DetailViewController.h"

@interface ImageViewController : UIViewController

@property (nonatomic, strong) Photo *currentImage;
@property (weak, nonatomic) IBOutlet UIImageView *ImageData;

@end
