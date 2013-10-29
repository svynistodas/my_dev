//
//  InfoViewController.h
//  PhotoViewer2
//
//  Created by Arnoldas on 6/12/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface InfoViewController : UIViewController

@property (nonatomic, strong) Photo *currentPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
- (IBAction)dismiss:(id)sender;

@end
