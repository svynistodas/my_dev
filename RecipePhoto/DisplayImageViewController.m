//
//  DisplayImageViewController.m
//  RecipePhoto
//
//  Created by Arnoldas on 9/15/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "DisplayImageViewController.h"

@interface DisplayImageViewController ()

@end

@implementation DisplayImageViewController

@synthesize ImageFileName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //UIImage *image = [UIImage imageNamed:ImageFileName];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
   
    [self.currentImage setImage:image];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
