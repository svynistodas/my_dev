//
//  ViewController.m
//  SummerTime
//
//  Created by Arnoldas on 6/1/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize datePicker;

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

- (IBAction)ShowDate:(id)sender {
    NSDate *chosen = [datePicker date];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"EEEE"];
    
    NSString *weekday = [formater stringFromDate:chosen];
    NSString *msg = [[NSString alloc] initWithFormat:@"That's a %@", weekday];
    
    UIAlertView *dateAlert = [[UIAlertView alloc]
                              initWithTitle: @"What ?"
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Thanks"
                              otherButtonTitles: nil];
    dateAlert.show;
}
@end
