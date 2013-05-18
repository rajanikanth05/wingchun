//
//  SifuOchVideoDetailsViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchVideoDetailsViewController.h"
#import "SifuOchDescriptionViewController.h"

@interface SifuOchVideoDetailsViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation SifuOchVideoDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        //NSLog(@"DetailItem: %@", _detailItem);
        // Update the view.
        //[self configureView];
    }
    
    //if (self.masterPopoverController != nil) {
      //  [self.masterPopoverController dismissPopoverAnimated:YES];
    //}
}

- (void)setSashItem:(SifuOchSashObject *)newSashItem {
    if (_sashItem != newSashItem) {
        _sashItem = newSashItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];

    [self embedYouTube:[_sashItem url] frame:CGRectMake(20, 20, 300, 250)];
    [[self videoDescriptionView] setText:[_sashItem description]];
    UITapGestureRecognizer *moreDescriptionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreDetails)];
    [_videoDescriptionView addGestureRecognizer:moreDescriptionTap];
    
    [_contact addTarget:self action:@selector(sendEmail:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setToRecipients:[NSArray arrayWithObject:@"rajanikanth05@gmail.com"]];
    
    [controller setSubject:@"My Subject"];
    [controller setMessageBody:@"Hello there." isHTML:NO];
    if (controller) [self presentViewController:controller animated:YES completion:^{
        
    }];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - Video web view
- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
    [self.videoScreen loadHTMLString:html baseURL:nil];
}

- (void)moreDetails {
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        SifuOchDescriptionViewController *sdvc = [segue destinationViewController];
        [sdvc setSashItem:_sashItem];
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSLog(@"SHI");
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 6, 300, 30);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithHue:(136.0/360.0)  // Slightly bluish green
                                 saturation:1.0
                                 brightness:0.60
                                      alpha:1.0];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake(0.0, 1.0);
    label.font = [UIFont boldSystemFontOfSize:16];
    label.text = @"HELLOOOO";
    
    // Create header view and add label as a subview
    
    // you could also just return the label (instead of making a new view and adding the label as subview. With the view you have more flexibility to make a background color or different paddings
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 50)];
    [view addSubview:label];
    
    return view;
}

/*
 #pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


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
