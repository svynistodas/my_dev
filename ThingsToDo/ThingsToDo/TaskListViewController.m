//
//  TaskListViewController.m
//  ThingsToDo
//
//  Created by Arnoldas on 6/20/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "TaskListViewController.h"
#import "Task.h"
#import "AddTaskViewController.h"
#import "EditTaskViewController.h"

@interface TaskListViewController ()
{
    sqlite3 *personDB;
    NSString *dbPathString;
}

@end

@implementation TaskListViewController

@synthesize tasks = _task;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self readTaskFromDatabase];
    //[self createOrOpenDB];
    
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"addTaskSegue"]){
        UINavigationController *navCon = segue.destinationViewController;
        AddTaskViewController *atvc = [navCon.viewControllers objectAtIndex:0];
       // AddTaskViewController *atvc = segue.destinationViewController;
        
        atvc.taskListViewController = self;
    }else if ([segue.identifier isEqualToString:@"EditDoneTaskSegue"] || [segue.identifier isEqualToString:@"EditNorDoneTaskSegue"]){
        EditTaskViewController *etvc = segue.destinationViewController;
        etvc.task = [self.tasks objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
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
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NotDoneCellIdentifier = @"NotDoneTaskCell";
    static NSString *DoneCellIdentifier = @"DoneTaskCell";
    
    Task *currentTask = [self.tasks objectAtIndex:indexPath.row];
    NSString *CellIdentifier = currentTask.done ? DoneCellIdentifier : NotDoneCellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //if(){
        cell.textLabel.text = currentTask.name;
    //}
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}




// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Task *moveTask = [self.tasks objectAtIndex:fromIndexPath.row];
    [self.tasks removeObjectAtIndex:fromIndexPath.row];
    [self.tasks insertObject:moveTask atIndex:toIndexPath.row];
}


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

#pragma mark - IBAction 

- (void)editButtonPressed:(id)sender{
    self.editing = !self.editing;
}

- (void)createOrOpenDB
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"tasks2.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        //creat db here
        if (sqlite3_open(dbPath, &personDB)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS task (ID INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(255))";
            sqlite3_exec(personDB, sql_stmt, NULL, NULL, &error);
            const char *sql_stmt2 = "INSERT INTO task (name) VALUES ('Elephant')";
            sqlite3_exec(personDB, sql_stmt2, NULL, NULL, &error);
            
            sqlite3_close(personDB);
            
            NSLog(@"DB was created");
            
        }else{
            NSLog(@"Failed to create");
        }
    }
}

-(void) readTaskFromDatabase{
    
    sqlite3 *database;
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *databaseName = @"taskst.sqlite";
    NSString *databasePath = [docPath stringByAppendingPathComponent:databaseName];
    
    self.tasks = [[NSMutableArray alloc] init];
    /*
    Task *task = [[Task alloc] initWithName:@"my first task" done:NO];
    [self.tasks addObject:task];
    
    Task *donetask = [[Task alloc] initWithName:@"my first done task" done:YES];
    [self.tasks addObject:donetask];
    */
    
    //NSString *sqliteDB = [[NSBundle mainBundle] pathForResource:@"tasks2" ofType:@"db"];
    
    /*if(sqlite3_open([sqliteDB UTF8String], &database) != SQLITE_OK){
        NSLog(@"Failed to open database");
    }else{
        NSLog(@"Database open");
    }*/
    
    //NSFileManager *fileManager = [NSFileManager defaultManager];
    
    sqlite3_stmt *compiledStatment;
    
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK){
       // NSLog(@"Success to open database %@", database);
        
        NSString *query = @"SELECT * FROM task";
        
        
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compiledStatment, NULL) == SQLITE_OK) {
            NSLog(@"Success sqlite3_prepare_v2");
            
            while (sqlite3_step(compiledStatment) == SQLITE_ROW) {
                NSString *tName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatment, 1)];
                NSLog(@"sql %@", tName);
                BOOL tDone = NO;
                
                Task *task = [[Task alloc] initWithName:tName done:tDone];
                [self.tasks addObject:task];
            }
        }else{
            NSLog(@"Failed to sqlite3_prepare_v2");
            NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(database), sqlite3_errcode(database));
        }
        sqlite3_finalize(compiledStatment);
        
    }else{
        NSLog(@"Failed to open database");
    }
    sqlite3_close(database);
    
    
}





@end
