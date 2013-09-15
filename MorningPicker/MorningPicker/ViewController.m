//
//  ViewController.m
//  MorningPicker
//
//  Created by Arnoldas on 6/2/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize moodlist, Pi_Data1;

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [moodlist count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [moodlist objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIColor *newColor;
    
    switch (row) {
        case 0: case 1: case 2:
            newColor = [UIColor yellowColor];
            break;
        case 3: case 4: case 5:
            newColor = [UIColor grayColor];
            break;
        default:
            newColor = [UIColor purpleColor];
            break;
    }
    self.view.backgroundColor = newColor;
    NSLog(@"%i", row);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    moodlist = [[NSArray alloc]
                initWithObjects:@"kokokokokok",@"Happy",@"Cheerful",
                @"Fine",@"Tired",@"Maudlin",@"Depressed",@"Overwhelmed"
                , nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setData1:(id)sender {
    
    Pi_Data1.hidden = YES;
    
    NSLog(@"set data");
    
}

- (IBAction)SelectData:(id)sender {
    
    
}
@end
