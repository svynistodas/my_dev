//
//  EditTaskViewController.h
//  ToDoTask2
//
//  Created by Arnoldas on 7/27/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@interface EditTaskViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, assign) IBOutlet UISwitch *doneSwitch;
@property (nonatomic, strong) Task *task;

- (IBAction)taskDataChange:(id)sender;


@end
