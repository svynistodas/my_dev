//
//  ViewController.h
//  SpeedCalc
//
//  Created by Arnoldas on 8/9/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *SpeedField;
@property (strong, nonatomic) IBOutlet UITextField *DistanceField;
@property (strong, nonatomic) IBOutlet UILabel *TimeLable;
@property (strong, nonatomic) IBOutlet UITextField *NewSpeedField;
@property (strong, nonatomic) IBOutlet UILabel *NewTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeDifferenceLabel;
@property (strong, nonatomic) IBOutlet UIButton *CalculateButton;
- (IBAction)CalculateButton:(id)sender;
- (IBAction)DissmisKeyboard:(id)sender;

@end
