//
//  SifuOchAboutViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/27/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchAboutViewController.h"
#import <MapKit/MapKit.h>

@interface SifuOchAboutViewController ()

@end

@implementation SifuOchAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_logo setImage:[UIImage imageNamed:@""]];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    [self embedYouTube:@"http://www.youtube.com/v/NgGyJZ2ppkw" frame:CGRectMake(20, 20, 300, 250) ];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDirections:(id)sender {
    //UIApplication *app = [UIApplication sharedApplication];
    //[app openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q=Sifu Och Wing Chun"]];
    
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) {
        CLLocationCoordinate2D point;
        point.latitude = 28.0460239;
        point.longitude = -81.9568058;
        MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:point addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placeMark];
        [mapItem setName:@"Sifu Och Wing Chun"];
        [mapItem openInMapsWithLaunchOptions:nil];
    }
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
    NSLog(@"mukka");
    [_viedoView loadHTMLString:html baseURL:nil];
}


- (IBAction)callSifuOch:(id)sender {
    NSLog(@"hello");
    NSString *phoneNumber = [@"tel://" stringByAppendingString:@"8638000711"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
@end
