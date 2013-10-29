//
//  Photo.h
//  PhotoViewer
//
//  Created by Arnoldas on 6/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *notes;

@end
