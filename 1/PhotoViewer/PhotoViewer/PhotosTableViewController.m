//
//  PhotosTableViewController.m
//  PhotoViewer
//
//  Created by Arnoldas on 6/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

NSMutableArray *photos;

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"ShowPhoto"]){
        DisplayViewController *dvc = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Photo *c = [photos objectAtIndex:path.row];
        [dvc setCurrentPhoto:c];
    }
}

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
    
    photos = [[NSMutableArray alloc] init];
        
    Photo *pic = [[Photo alloc] init];
    [pic setName:@"Overlook"];
    [pic setFilename:@"overlook.png"];
    [pic setNotes:@"Looking out over the Pacific Ocean"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Flag"];
    [pic setFilename:@"flag.png"];
    [pic setNotes:@"California flag, blowing in the wind against a blue sky."];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Beach"];
    [pic setFilename:@"beach.png"];
    [pic setNotes:@"Waves lapping against a California beach."];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Olives"];
    [pic setFilename:@"olives.png"];
    [pic setNotes:@"Olives ripening on a tree."];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Winery"];
    [pic setFilename:@"winery.png"];
    [pic setNotes:@"A sign for the Old Creek Ranch and Winery."];
    [photos addObject:pic];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Photo *current = [photos objectAtIndex:indexPath.row];
    [cell.textLabel setText:[current name]];

    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
