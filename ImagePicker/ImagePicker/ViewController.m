//
//  ViewController.m
//  ImagePicker
//
//  Created by Arnoldas on 10/27/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AFURLSessionManager.h"
#import "AFURLConnectionOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PickImage:(id)sender {
    UIImagePickerController *imagePickerControler = [[UIImagePickerController alloc] init];
    imagePickerControler.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerControler.delegate = (id)self;
    [self presentViewController:imagePickerControler animated:YES completion:nil];
}

#pragma mark - Image picker delegate methods

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    muImage.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)UploadImage:(id)sender {
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"foo":@"barr"};
    UIImage *image = muImage.image;
    [manager POST:@"http://a1.moze.lt/imagigi/index.php"
       parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.7)
                                name:@"file"
                            fileName:@"photo.jpg"
                            mimeType:@"image/jpeg"];
}
          success:^(AFHTTPRequestOperation *operation, id responseObject){
              NSLog(@"Success: %@", responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
              NSLog(@"Error %@", operation.responseString);
          }];
    
        
}

@end
