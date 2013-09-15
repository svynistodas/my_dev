//
//  ViewController.h
//  CalcMoon
//
//  Created by Arnoldas on 6/1/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)calculate:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *Number1;
@property (weak, nonatomic) IBOutlet UITextField *Number2;
@property (weak, nonatomic) IBOutlet UITextField *Answer;

@end
