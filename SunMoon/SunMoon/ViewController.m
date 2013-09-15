//
//  ViewController.m
//  SunMoon
//
//  Created by Arnoldas on 6/1/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize Number1, Number2, Answer;

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

- (IBAction)Calculate:(id)sender {
   // NSString *s_numb1 = [[NSString alloc] initWithFormat:@"%@", [Number1 text] ];
    NSDecimalNumber *numb1 = [NSDecimalNumber decimalNumberWithString:[Number1 text]];
    NSDecimalNumber *numb2 = [NSDecimalNumber decimalNumberWithString:[Number2 text]];
    NSDecimalNumber *ans = [numb1 decimalNumberByMultiplyingBy: numb2];    
    [Answer setText:[NSString stringWithFormat:@"%1.6f", [ans floatValue]]];
        
    [Number1 resignFirstResponder];
    [Number2 resignFirstResponder];
    [Answer resignFirstResponder];
}

- (IBAction)dismissKeyboard:(id)sender {
    [Number1 resignFirstResponder];
    [Number2 resignFirstResponder];
    [Answer resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
