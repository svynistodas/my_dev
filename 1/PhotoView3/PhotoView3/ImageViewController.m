//
//  ImageViewController.m
//  PhotoView3
//
//  Created by Arnoldas on 6/13/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

@synthesize currentImage;

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
   /* UIImage *image = [UIImage imageNamed:[currentImage filename]];
    [self.ImageData setImage:image];
    [self setTitle:[currentImage title]];*/
}/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *dvc = [segue destinationViewController];
    [dvc setCurrentImage:[self currentImage]];
}*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
