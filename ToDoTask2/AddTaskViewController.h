//
//  AddTaskViewController.h
//  ToDoTask2
//
//  Created by Arnoldas on 7/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaskListViewController;

@interface AddTaskViewController : UITableViewController
- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic, strong) TaskListViewController *taskListViewController;

@end
