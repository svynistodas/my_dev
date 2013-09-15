//
//  ViewController.h
//  multitask
//
//  Created by Arnoldas on 6/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)displayDate:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
