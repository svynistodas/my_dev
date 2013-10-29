//
//  ViewController.h
//  ImagePicker
//
//  Created by Arnoldas on 10/27/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate>
{
 IBOutlet UIImageView *muImage;
}

- (IBAction)PickImage:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *UploadImage;
- (IBAction)UploadImage:(id)sender;

@end
