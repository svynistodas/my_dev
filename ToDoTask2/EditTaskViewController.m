//
//  EditTaskViewController.m
//  ToDoTask2
//
//  Created by Arnoldas on 7/27/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "EditTaskViewController.h"
#import "Task.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

@synthesize nameField, doneSwitch, task;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameField.text = self.task.name;
    [self.doneSwitch setOn:self.task.done];
    
    NSLog(@"in edit: %@", self.task.name);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)taskDataChange:(id)sender{
    
    self.task.name = self.nameField.text;
    self.task.done = self.doneSwitch.isOn;
    
}


@end
