//
//  PhotoCell.m
//  AnonImage
//
//  Created by Arnoldas on 8/26/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()
// 1
@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;
@end

@implementation PhotoCell

- (void) setAsset:(ALAsset *)asset
{
    // 2
    _asset = asset;
    self.photoImageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
