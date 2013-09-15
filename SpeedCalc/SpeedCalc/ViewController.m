//
//  ViewController.m
//  SpeedCalc
//
//  Created by Arnoldas on 8/9/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize SpeedField, DistanceField, NewSpeedField;
@synthesize NewTimeLabel, TimeLable, TimeDifferenceLabel;

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

- (IBAction)CalculateButton:(id)sender {
    NSString *speedText = SpeedField.text;
    NSString *distanceText = DistanceField.text;
    
    // v = s/t
    float v = [speedText floatValue];
    float s = [distanceText floatValue];
    float t = s/v;
    
    TimeLable.text = [[NSNumber numberWithFloat:t] stringValue];
    
    NSString *newSpeedText = NewSpeedField.text;
    float v2 = [newSpeedText floatValue];
    float t2 = s/v2;
    NewTimeLabel.text = [[NSNumber numberWithFloat:t2] stringValue];
    float deltaT = t - t2;
    TimeDifferenceLabel.text = [[NSNumber numberWithFloat:deltaT] stringValue];
}

- (IBAction)DissmisKeyboard:(id)sender {
    [SpeedField resignFirstResponder];
    [DistanceField resignFirstResponder];
    [NewSpeedField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end
