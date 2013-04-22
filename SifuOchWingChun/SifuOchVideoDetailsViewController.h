//
//  SifuOchVideoDetailsViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SifuOchSashObject.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface SifuOchVideoDetailsViewController : UITableViewController<UISplitViewControllerDelegate, MFMailComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (retain, nonatomic) SifuOchSashObject *sashItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIWebView *videoScreen;
@property (weak, nonatomic) IBOutlet UITextView *videoDescriptionView;
@property (retain, nonatomic) IBOutlet UIButton *contact;

@end
