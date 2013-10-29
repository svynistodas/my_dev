//
//  DisplayViewController.m
//  PhotoViewer
//
//  Created by Arnoldas on 6/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

@synthesize currentPhoto;

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
    
    UIImage *image = [UIImage imageNamed:[currentPhoto filename]];
    [self.currentImage setImage:image];
    [self setTitle:[currentPhoto name]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    InfoViewController *ivc = [segue destinationViewController];
    [ivc setCurrentPhoto:[self currentPhoto]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
