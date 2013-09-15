//
//  ViewController.h
//  MorningPicker
//
//  Created by Arnoldas on 6/2/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property NSArray *moodlist;

@property (weak, nonatomic) IBOutlet UILabel *L_selectedData1;

- (IBAction)setData1:(id)sender;
- (IBAction)SelectData:(id)sender;


@property (weak, nonatomic) IBOutlet UIPickerView *Pi_Data1;

@end
