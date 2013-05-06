//
//  SifuOchDetailViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SifuOchDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (retain, nonatomic) NSString *videoUrl;
@property (retain, nonatomic) NSString *viewTitle;
@property (retain, nonatomic) NSString *videoDescription;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIWebView *videoScreen;
@property (weak, nonatomic) IBOutlet UITextView *videoDescriptionView;
@end
