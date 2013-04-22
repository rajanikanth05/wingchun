//
//  SifuOchWebViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/26/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchWebViewController.h"

@interface SifuOchWebViewController ()

@end

@implementation SifuOchWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setWebUrl:(NSString *)webUrl1 {
    if (![_webUrl isEqualToString:webUrl1]) {
        _webUrl = webUrl1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    NSLog(@"URL: %@", _webUrl);
    NSURL *loadUrl = [NSURL URLWithString:_webUrl];
    NSURLRequest *reqObj = [NSURLRequest requestWithURL:loadUrl];
    [_webView loadRequest:reqObj];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
