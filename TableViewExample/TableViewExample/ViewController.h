//
//  ViewController.h
//  TableViewExample
//
//  Created by Arnoldas on 6/2/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *courses;
@property (nonatomic, strong) NSArray *courseKeys;

@property (nonatomic, strong) NSDictionary *courses_web;
@property (nonatomic, strong) NSArray *courseKeys_web;

@end
