//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Arnoldas on 9/14/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "RecipeCollectionViewController.h"

@interface RecipeCollectionViewController (){
    NSArray *recipeImages;
    NSMutableArray *ImagesURLs;
}

@end

@implementation RecipeCollectionViewController

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
    // Initialize recipe image array
    recipeImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
 
    NSString *json_url = @"http://demo.arnoldas.eu/opencart/index.php?route=product/product/getjsonimages";
    ImagesURLs = [[NSMutableArray alloc] init];
        
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
    //Label.text = [NSString stringWithFormat:@"%@",json[@"images"][0][@"image_url"],nil];
    
    //NSString *tmp_image = @"http://demo.arnoldas.eu/opencart/image/data/nano/1.jpg";
    //NSURL *ImageUrl = [[NSURL alloc] initWithString:@"http://www.constructionweekonline.com/pictures/Aldar/Kuwait_City.jpg"];
    
    for (id key in json[@"images"]){
        //NSLog(@"key: %@, value: %@", key, [json objectForKey:key]); // json[@"images"][0][@"image_url"]);
        [ImagesURLs addObject:[[NSURL alloc] initWithString:(NSString *)key]];
    }
    // }
    //NSLog(@"%@", ImagesURLs);
    NSLog(@"update %i",ImagesURLs.count);
    [self.collectionView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DisplayImage"]) {
        DisplayImageViewController *divc = [segue destinationViewController];
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *index = [indexPaths objectAtIndex:0];
        //NSString *i = [recipeImages objectAtIndex:index.row];
        //[divc setImageFileName:i];
        NSURL *u = [ImagesURLs objectAtIndex:index.row];
        [divc setImageURL:u];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return recipeImages.count;
    NSLog(@"collection %i",ImagesURLs.count);
    return ImagesURLs.count;
    //return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[ImagesURLs objectAtIndex:indexPath.row]];
   // NSURL *ImageUrl = [[NSURL alloc] initWithString:@"http://www.constructionweekonline.com/pictures/Aldar/Kuwait_City.jpg"];
    //NSData *imageData = [[NSData alloc] initWithContentsOfURL:ImageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    recipeImageView.image = image;
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];

    
    return cell;
}


@end
