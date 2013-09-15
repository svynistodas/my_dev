//
//  ViewController.h
//  SummerTime
//
//  Created by Arnoldas on 6/1/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)ShowDate:(id)sender;

@end
