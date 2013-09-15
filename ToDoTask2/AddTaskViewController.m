//
//  AddTaskViewController.m
//  ToDoTask2
//
//  Created by Arnoldas on 7/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TaskListViewController.h"
#import "Task.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

@synthesize nameField = _nameField;
@synthesize taskListViewController = _taskListViewController;

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

- (IBAction)doneButtonPressed:(id)sender {
    Task *newTask = [[Task alloc] initWithName:self.nameField.text done:NO];
    [self.taskListViewController.tasks addObject:newTask];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
