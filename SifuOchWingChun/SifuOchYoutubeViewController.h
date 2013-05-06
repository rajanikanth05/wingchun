//
//  SifuOchYoutubeViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/15/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SifuOchAPIRequest.h"
#import "GDataYouTube.h"
#import "GDataServiceGoogleYouTube.h"

@interface SifuOchYoutubeViewController : UITableViewController

@property(retain, nonatomic) SifuOchAPIRequest *apiHandler;
@property(retain, nonatomic) GDataFeedYouTubeVideo *videos;
@end
