//
//  SpeedCalcViewController.h
//  SpeedCal2
//
//  Created by Arnoldas on 8/10/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MI_TO_KM 1.609

@interface SpeedCalcViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *SpeedField;
@property (strong, nonatomic) IBOutlet UITextField *DistanceField;
@property (strong, nonatomic) IBOutlet UILabel *TimeLabel;
@property (strong, nonatomic) IBOutlet UITextField *NewSpeedField;
@property (strong, nonatomic) IBOutlet UILabel *NewTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeDiffLabel;
@property (strong, nonatomic) IBOutlet UILabel *SpeedLabel;
@property (strong, nonatomic) IBOutlet UILabel *DistanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *NewSpeedLabel;


- (IBAction)CalculateButton:(id)sender;
- (IBAction)DissmissButton:(id)sender;

@end
