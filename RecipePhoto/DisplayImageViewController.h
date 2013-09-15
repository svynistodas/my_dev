//
//  DisplayImageViewController.h
//  RecipePhoto
//
//  Created by Arnoldas on 9/15/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayImageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *currentImage;
@property (strong, nonatomic) NSString *ImageFileName;

@end
