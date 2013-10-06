//
//  LatestFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Arnoldas on 10/6/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "LatestFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotosTVC ()

@end

@implementation LatestFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.photos = [FlickrFetcher latestGeoreferencedPhotos];
    
}


@end
