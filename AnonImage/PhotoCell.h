//
//  PhotoCell.h
//  AnonImage
//
//  Created by Arnoldas on 8/26/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoCell : UICollectionViewCell

@property(nonatomic, strong) ALAsset *asset;

@end