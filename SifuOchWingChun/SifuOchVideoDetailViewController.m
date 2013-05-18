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
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];

    self.videoDescriptionView.text = self.videoDescription;
    [self embedYouTube:self.videoUrl frame:CGRectMake(0, 0, 280, 265)];
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
    NSLog(@"kaka %@", html);
   [self.videoView loadHTMLString:html baseURL:nil];
}

@end
