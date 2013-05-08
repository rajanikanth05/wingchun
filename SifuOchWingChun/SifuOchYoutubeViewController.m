//
//  SifuOchYoutubeViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/15/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchYoutubeViewController.h"
#import "SifuOchYoutubeChannel.h"
#import "SifuOchVideoViewCell.h"
#import "SifuOchVideoDetailsViewController.h"

//@interface SifuOchYoutubeViewController ()
//-(GDataServiceGoogleYouTube *)youtubeService;
//@end

@implementation SifuOchYoutubeViewController

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
    [self pullYoutubeChannelVideos];
    //[self performSelectorInBackground:@selector(pullYoutubeChannelVideos) withObject:nil];
}


- (void)pullYoutubeChannelVideos {
    GDataServiceGoogleYouTube *service = [self youtubeService];
    NSString *uploadId = kGDataYouTubeUserFeedIDUploads;
    NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"rajanikanth5" userFeedID:uploadId];
    [service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(request:finishedWithFeed:error:)];
}
- (void)request:(GDataServiceTicket *)ticket
finishedWithFeed:(GDataFeedBase *)aFeed
          error:(NSError *)error {
    self.videoData = (GDataFeedYouTubeVideo *)aFeed;
    self.videos = [self.videoData entries];
    [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:NO];
}

- (void)reloadTableView {
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.videos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SifuOchVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    GDataEntryYouTubeVideo *vid = (GDataEntryYouTubeVideo *)self.videos[indexPath.row];
    
    cell.titleLabel.text = vid.title.stringValue;
    cell.videoIcon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[(GDataMediaThumbnail *)[(GDataYouTubeMediaGroup *)vid.mediaGroup mediaThumbnails][0] URLString]]]];
    cell.descriptionLabel.text = vid.mediaGroup.mediaDescription.contentStringValue;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"VideoDetailSegue"]) {
        GDataEntryYouTubeVideo *vid = (GDataEntryYouTubeVideo *)self.videos[[[self.tableView indexPathForSelectedRow] row]];
    
        SifuOchVideoDetailsViewController *controller = [segue destinationViewController];
        controller.videoDescriptionView.text = vid.mediaGroup.mediaDescription.contentStringValue;
    }
}

@end
