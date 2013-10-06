//
//  ViewController.m
//  fetch json
//
//  Created by Arnoldas on 10/5/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UILabel *Label;
    
}
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //NSString *json_url = @"http://api.kivaws.org/v1/loans/search.json?status=fundraising";
    
 //   NSString *json_url = @"http://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=root";
   
    NSString *json_url = @"http://demo.arnoldas.eu/opencart/index.php?route=product/product/getjsonimages";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:json_url]
                            ];
        //3
        NSDictionary* json = nil;
        if (kivaData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:kivaData
                    options:kNilOptions
                    error:nil];
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self updateUIWithDictionary: json];
        });
        
    });
    
}

-(void)updateUIWithDictionary:(NSDictionary*)json {
   // @try {
       /* Label.text = [NSString stringWithFormat:
                      @"%@ from %@ needs %@ %@\nYou can help by contributing as little as 25$!",
                      json[@"loans"][0][@"name"],
                      json[@"loans"][0][@"location"][@"country"],
                      json[@"loans"][0][@"loan_amount"],
                      json[@"loans"][0][@"use"],
                      nil];*/
    Label.text = [NSString stringWithFormat:@"%@",json[@"images"][0][@"image_url"],nil];
    
    NSLog(@"%@",json);
   // }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
