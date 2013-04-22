//
//  SifuOchMasterViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SifuOchDetailViewController;
@class SifuOchVideoDetailsViewController;

@interface SifuOchMasterViewController : UITableViewController

@property(retain, nonatomic) NSMutableArray *sashItems;
@property (strong, nonatomic) SifuOchDetailViewController *detailViewController;
@property (strong, nonatomic) SifuOchVideoDetailsViewController *videoDetailViewController;

@end
