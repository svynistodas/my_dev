//
//  DetailViewController.m
//  Plain O Notes
//
//  Created by Arnoldas on 8/16/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "DetailViewController.h"
#import "Data.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize tView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [Data setCurrentKey:_detailItem];
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    //if (self.detailItem) {
    //    self.tView.text = [self.detailItem description];
    //}
    
    NSString *currentNote = [[Data getAllNotes] objectForKey:[Data getCurrentKey]];
    if (![currentNote isEqualToString:kDefaultText]) {
        self.tView.text = currentNote;
    }else{
        self.tView.text = @"";
    }
    [self.tView becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    if(![self.tView.text isEqualToString:@""]){
        [Data setNoteForCurrentKey:self.tView.text];
    }else{
        [Data removeNoteForKey:[Data getCurrentKey]];
    }
    [Data saveNotes];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
