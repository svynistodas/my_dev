//
//  SpeedCalcViewController.m
//  SpeedCal2
//
//  Created by Arnoldas on 8/10/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "SpeedCalcViewController.h"

@interface SpeedCalcViewController ()
{
    NSArray *speedTitles;
}

@end

@implementation SpeedCalcViewController

@synthesize SpeedField, DistanceField, NewSpeedField;
@synthesize NewTimeLabel, TimeLabel, TimeDiffLabel;
@synthesize SpeedLabel, DistanceLabel, NewSpeedLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger MeasureRow = [prefs integerForKey:@"measurementRow"];
    //NSLog(@"row %i", MeasureRow );
    
    speedTitles = [NSArray arrayWithObjects:@"km", @"mi", nil];
        
    SpeedLabel.text = [[NSString alloc] initWithFormat:@"%@/h", [speedTitles objectAtIndex:MeasureRow]];
    DistanceLabel.text = [speedTitles objectAtIndex:MeasureRow];
    NewSpeedLabel.text = [[NSString alloc] initWithFormat:@"%@/h", [speedTitles objectAtIndex:MeasureRow]];
            
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)e shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *substring = NewSpeedField.text;
    substring = [substring stringByAppendingString:string];
    NSLog(@"Text : %@",substring);
    return YES;
}


- (IBAction)textEditBegin:(id)sender {
    NSLog(@"editing");
    [self animateTextField: sender up: YES];
}
- (IBAction)textEditingEnd:(id)sender {
    NSLog(@"end of editing");
    [self animateTextField: sender up: NO];
}

- (void) animateTextField: (UITextField *) textField up: (BOOL) up{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)CalculateButton:(id)sender {
    
    NSString *speedText = SpeedField.text;
    NSString *distanceText = DistanceField.text;
    float v,s,t, v2, t2, deltaT;
    
    // v = s/t
    v = [speedText floatValue];
    s = [distanceText floatValue];
    if(v == 0)
        t = 0;
    else
        t = s/v;
    
    //NSLog(@"t = %f", t);
       
    NSString *timeString = [self getTime:t * 60 * 60];    
    TimeLabel.text = timeString; //[[NSNumber numberWithFloat:t] stringValue];
    
    NSString *newSpeedText = NewSpeedField.text;
    v2 = [newSpeedText floatValue];
    if(v2 == 0)
        t2 = 0;
    else
        t2 = s/v2;
    
    NewTimeLabel.text = [self getTime:t2 * 60 * 60];  //[[NSNumber numberWithFloat:t2] stringValue];
    deltaT = t - t2;
    TimeDiffLabel.text = [self getTime:deltaT * 60 * 60];  //[[NSNumber numberWithFloat:deltaT] stringValue];
    
}

- (NSString *) getTime:(int)time{
    
    float days, hours, minutes, seconds;
    int timeInSeconds = time;
    NSString *timeString = [[NSString alloc] init];
    
    days = floor(time / (60 * 60 * 24));    
    NSString *timeDays = [[NSString alloc] initWithFormat:@"%.0f d", days];
    //if(days >0)
    //    timeString = [NSString stringWithFormat:@"%@,%@",];
    
    time -= days * (60 * 60 * 24);
    hours = floor(time / (60 * 60));
    NSString *timeHours = [[NSString alloc] initWithFormat:@"%.0f h", hours];
    time -= hours * (60 * 60);
    
    minutes = floor(time / 60);
    NSString *timeMinutes = [[NSString alloc] initWithFormat:@"%.0f min", minutes];
    time -= minutes * 60;
    
    seconds = floor(time);
    NSString *timeSeconds = [[NSString alloc] initWithFormat:@"%.0f sec.", seconds];
    time -= seconds;
    
    //timeString = [[NSString alloc] initWithFormat:@"%.0f:%.0f:%.0f ", hours, minutes, seconds];
    if(days > 0){
        timeString = [[NSString alloc] initWithFormat:@"%@ %@", timeString, timeDays];
    }
    
    if(hours > 0){
        timeString = [[NSString alloc] initWithFormat:@"%@ %@", timeString, timeHours];
    }
    
    if(minutes > 0){
        timeString = [[NSString alloc] initWithFormat:@"%@ %@", timeString, timeMinutes];
    }
    
    if(seconds > 0){
        timeString = [[NSString alloc] initWithFormat:@"%@ %@", timeString, timeSeconds];
    }
    
    if(timeInSeconds <= 0){
        timeString = @"0 sec.";
    }
    
    NSLog(@"seconsd %i", timeInSeconds);
    
    //NSLog(@" d:%.0f h:%.0f m:%.0f s:%.0f ", days, hours, minutes, seconds);
    return timeString;
}

- (IBAction)DissmissButton:(id)sender {
    [SpeedField resignFirstResponder];
    [DistanceField resignFirstResponder];
    [NewSpeedField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
