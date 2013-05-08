//
//  SifuOchVideoDetailViewController.h
//  SifuOchWingChun
//
//  Created by Beesabathini,Rajanikanth on 5/8/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SifuOchVideoDetailViewController : UITableViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *videoView;
@property (weak, nonatomic) IBOutlet UITextView *videoDescriptionView;
@property (weak, nonatomic) NSString *videoUrl;
@property (weak, nonatomic) NSString *videoDescription;

@end
