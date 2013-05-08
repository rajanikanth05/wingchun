//
//  SifuOchNewsViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/27/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchNewsViewController.h"
#import "SifuOchWebViewController.h"

@interface SifuOchNewsViewController ()

@end

@implementation SifuOchNewsViewController

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
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    NSLog(@"HELLLLOOOO");
    _newsItems = [[NSMutableArray alloc] init];
    [_newsItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Pure Wing Chun Doesn't Exist", @"title", @"blah 111 blah 111 blah 111", @"description", @"http://sifuochwingchun.com/articles/in-depth-wing-chun/pure-wing-chun-doesnt-exist/", @"url", nil]];
    [_newsItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Kung Fu Is Dying", @"title", @"blah 222 blah 222 blah 222", @"description", @"http://sifuochwingchun.com/blog/martial-arts-kung-fu-is-dying/", @"url", nil]];
    [_newsItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Sifu Och Wing Chun, REAL Lakeland Self Defense", @"title", @"blah 333 blah 333 blah 333", @"description", @"http://sifuochwingchun.com/blog/sifu-och-wing-chun-real-lakeland-self-defense/", @"url", nil]];
    [_newsItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Lakeland Florida Martial Arts", @"title", @"blah 444 blah 444 blah 444", @"description", @"http://sifuochwingchun.com/blog/lakeland-florida-martial-arts-gung-fu/", @"url", nil]];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"COUNT: %d", [_newsItems count]);
    return [_newsItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:[[_newsItems objectAtIndex:indexPath.row] objectForKey:@"title"]];
    NSLog(@"HHHHHHHH");
    // Configure the cell...
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDictionary *item = [_newsItems objectAtIndex:[self.tableView indexPathForCell:sender].row];
    SifuOchWebViewController *webView = [segue destinationViewController];
    [webView setWebUrl:[item objectForKey:@"url"]];
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
