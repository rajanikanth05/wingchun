//
//  SifuOchDescriptionViewController.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/8/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchDescriptionViewController.h"

@interface SifuOchDescriptionViewController ()

@end

@implementation SifuOchDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDescription:(NSString *)newDescription {
    if (![_description isEqualToString:newDescription]) {
        _description = newDescription;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-application.png"]]];
    [_backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [_backButton setBackgroundColor:[UIColor clearColor]];
	// Do any additional setup after loading the view.
    [_navItem setTitle:[_sashItem title]];
    [_descriptionView setText:[_sashItem description]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    NSLog(@"Back");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
