//
//  SifuOchConnectViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/28/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchConnectViewController.h"
#import "SifuOchWebViewController.h"

@interface SifuOchConnectViewController ()

@end

@implementation SifuOchConnectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    _currentTag = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    _fbView = [[UIView alloc] initWithFrame:CGRectMake(47, 58, 92, 98)];
    [self.view addSubview:_fbView];
    [_facebook setTag:1];
    [_facebook addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    [_twitter setTag:2];
    [_twitter addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    [_instagram setTag:3];
    [_instagram addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    [_pinterest setTag:4];
    [_pinterest addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    [_foursquare setTag:5];
    [_foursquare addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    [_googleplus setTag:6];
    [_googleplus addTarget:self action:@selector(connectSocial:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (IBAction)connectSocial:(UIButton *)sender {
    NSLog(@"sender: %@", sender);
    _currentTag = sender.tag;
    NSLog(@"tagg: %d", _currentTag);
    [self performSegueWithIdentifier:@"socialSegue" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"tag: %d", _currentTag);
    if ([segue.identifier isEqualToString:@"socialSegue"]) {
        SifuOchWebViewController *sowvc = [segue destinationViewController];

        switch (_currentTag) {
            case 1 :
                [sowvc setWebUrl:@"https://www.facebook.com/pages/Sifu-Och-Wing-Chun-Kung-Fu-Lakeland-FL-Official-fan-page/111764312247887"];
                break;
            case 2 :
                [sowvc setWebUrl:@"https://twitter.com/SifuOchWingChun"];
                break;
            case 3 :
                [sowvc setWebUrl:@"http://www.sifuochwingchun.com"];
                break;
            case 4 :
                [sowvc setWebUrl:@"http://pinterest.com/sifuochwingchun/"];
                break;
            case 5 :
                [sowvc setWebUrl:@"http://pinterest.com/sifuochwingchun/"];
                break;
            case 6 :
                [sowvc setWebUrl:@"https://plus.google.com/111925239756630422200/"];
                break;
            default:
                break;
        }

    }
}
- (void)connectWithFacebook {
    //if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
    NSLog(@"heio");
    SLComposeViewController *fb = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fb setInitialText:@"Hello from Sifu Och Wing Chun"];
        [self presentViewController:fb animated:YES completion:^{
            
        }];
    //}
}

- (void)connectWithTwitter:(id)sender {
    
}

- (void)connectWithInstagram:(id)sender {
    
}

- (void)connectWithPinterest:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
