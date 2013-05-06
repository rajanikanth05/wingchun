//
//  SifuOchYoutubeViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/15/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchYoutubeViewController.h"
#import "SifuOchYoutubeChannel.h"

@interface SifuOchYoutubeViewController ()
-(GDataServiceGoogleYouTube *)youtubeService;
@end

@implementation SifuOchYoutubeViewController

//Undefined symbols for architecture i386:
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
    
    GDataServiceGoogleYouTube *service = [self youtubeService];
    NSString *uploadId = kGDataYouTubeUserFeedIDUploads;
    NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"rajanikanth5" userFeedID:uploadId];
    [service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(request:finishedWithFeed:error:)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)request:(GDataServiceTicket *)ticket
finishedWithFeed:(GDataFeedBase *)aFeed
          error:(NSError *)error {
    _videos = (GDataFeedYouTubeVideo *)aFeed;
    NSLog(@"VID: %@", _videos);
    [self.tableView reloadData];
}


- (GDataServiceGoogleYouTube *)youtubeService {
    static GDataServiceGoogleYouTube *_service = nil;
    if (!_service) {
        _service = [[GDataServiceGoogleYouTube alloc] init];
        [_service setUserAgent:@"AppWhirl-UserApp-1.0"];
        [_service setShouldCacheResponseData:YES];
        [_service setServiceShouldFollowNextLinks:YES];
    }
    [_service setUserCredentialsWithUsername:nil password:nil];
    return  _service;
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 }

@end
