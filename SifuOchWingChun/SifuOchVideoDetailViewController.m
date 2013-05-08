//
//  SifuOchVideoDetailViewController.m
//  SifuOchWingChun
//
//  Created by Beesabathini,Rajanikanth on 5/8/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchVideoDetailViewController.h"

@interface SifuOchVideoDetailViewController ()

@end

@implementation SifuOchVideoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.videoDescriptionView.text = self.videoDescription;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[self embedYouTube:self.videoUrl frame:CGRectMake(0, 0, 280, 265)];
}

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
    [self.videoView loadHTMLString:html baseURL:nil];
}

@end
