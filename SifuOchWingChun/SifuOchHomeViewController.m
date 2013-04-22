//
//  SifuOchHomeViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/27/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchHomeViewController.h"
#import "SifuOchMasterViewController.h"
#import "SifuOchWebViewController.h"
#import "SifuOchAboutViewController.h"
#import "SifuOchNewsViewController.h"
#import "SifuOchConnectViewController.h"
#import "SifuOchYoutubeViewController.h"

@interface SifuOchHomeViewController ()

@end

@implementation SifuOchHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"listening PushNotification");
        // Custom initialization
    }
    return self;
}

- (void)setTabBarItems:(NSMutableArray *)tabBarItems1 {
    if (tabBarItems1) {
        _tabBarItems = tabBarItems1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    NSLog(@"dhamal");
    _tabBarItems = [[NSMutableArray alloc] init];
    _tabBarItemViews = [[NSMutableArray alloc] init];
    [[[self navigationController] navigationBar] setTintColor:[UIColor clearColor]
     ];
    [_tabBarItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"user.png", @"image", @"About", @"title", nil]];
    [_tabBarItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"horse.png", @"image", @"Sashes", @"title", nil]];
    [_tabBarItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"love.png", @"image", @"Connect", @"title", nil]];
    [_tabBarItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"video.png", @"image", @"Videos", @"title", nil]];
    [_tabBarItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"calendar.png", @"image", @"Events", @"title", nil]];
    
    [self populateTabBarItems];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePushNotification:) name:@"PushNotification" object:nil];
    NSLog(@"willapp");
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)handlePushNotification:(NSNotification *)notification {
    NSLog(@"okay");
    [self performSegueWithIdentifier:@"loveSegue" sender:self];
}

- (void)populateTabBarItems {
    for (int i = 0; i < [_tabBarItems count]; i ++) {
        UIView *item = [self createTabItemWithPositionX:i*64 Y:0 Padding:4 andContent:[_tabBarItems objectAtIndex:i]];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showSelectedItem:)];
        [item addGestureRecognizer:tap];
        [item setTag:(i + 1)];
        [_tabBar addSubview:item];
        [_tabBarItemViews addObject:item];
    }
}

- (UIView *)createTabItemWithPositionX:(float)x Y:(float)y Padding:(float)padding andContent:(NSDictionary *)content {
    UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(x + 5, y, 60, 90)];
    [itemView setBackgroundColor:[UIColor clearColor]];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 30, 30)];
    [img setImage:[UIImage imageNamed:[content objectForKey:@"image"] ? [content objectForKey:@"image"] : @"WingChun"]];
    [img setBackgroundColor:[UIColor clearColor]];
    [itemView addSubview:img];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 46, 60, 10)];
    [title setText:[content objectForKey:@"title"] ? [content objectForKey:@"title"] : @"WingChun"];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setFont:[UIFont fontWithName:@"Futura" size:10]];
    [title setTextColor:[UIColor blackColor]];
    [title setBackgroundColor:[UIColor clearColor]];
    [itemView addSubview:title];
    
    return itemView;
}

- (void)showSelectedItem:(UIGestureRecognizer *)gesture {
    [self resetTabBarItemBackgroundColor];
    [[gesture view] setBackgroundColor:[UIColor grayColor]];
    
    switch ([[gesture view] tag]) {
        case 1:
            [self performSegueWithIdentifier:@"aboutSegue" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"sashSegue" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"loveSegue" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"loveSegue" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"newsSegue" sender:self];
            break;
            
        default:
            break;
    }
}

- (void)resetTabBarItemBackgroundColor {
    for(UIView *v in _tabBarItemViews) {
        [v setBackgroundColor:[UIColor clearColor]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"aboutSegue"]) {
        SifuOchAboutViewController *soavc = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"sashSegue"]) {
        SifuOchMasterViewController *somvc = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"loveSegue"]) {
        SifuOchConnectViewController *socvc = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"webSegue"]) {
        SifuOchWebViewController *sowvc = [segue destinationViewController];
        [sowvc setWebUrl:@"http://www.sifuochwingchun.com"];
    } else if ([[segue identifier] isEqualToString:@"videoSegue"]) {
        //SifuOchYoutubeViewController *soyvc = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"newsSegue"]) {
        SifuOchNewsViewController *sonvc = [segue destinationViewController];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
