//
//  SettingsViewController.m
//  SpeedCal2
//
//  Created by Arnoldas on 8/10/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    NSLog(@"measure %i", MeasureRow );
    
    //NSUInteger ints[2] = {0,0};
    //NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:ints length:2];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:MeasureRow inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    //Here is your code
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[data objectAtIndex:indexPath.row] isSelected]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}*/
/*
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *oldIndex = [tableView indexPathForSelectedRow];
    
    [tableView cellForRowAtIndexPath:oldIndex].accessoryType = UITableViewCellAccessoryNone;
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    return indexPath;
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self ClearTableViewCheckmark:tableView];
    NSIndexPath *indexPathForSelectedRow = [tableView indexPathForSelectedRow];
    //NSIndexPath *selectedIndex = [NSIndexPath indexPathForRow:1 inSection:0];
    
    //UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    //NSString *cellText = selectedCell.textLabel.text;
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    [[NSUserDefaults standardUserDefaults] setInteger: indexPathForSelectedRow.row forKey: @"measurementRow"];
    
    NSLog(@"select: %i", indexPathForSelectedRow.row);
}

- (void)ClearTableViewCheckmark:(UITableView *)tableView{
   
    for (int i = 0; i < [tableView numberOfSections]; i++) {
        for (int j = 0; j < [tableView numberOfRowsInSection:i]; j++) {
            NSUInteger ints[2] = {i,j};
           // NSLog(@"ints: %i : %i", i,j);
            NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:ints length:2];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            //Here is your code
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
}

- (IBAction)CloseButton:(id)sender {
    NSLog(@"close button pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
