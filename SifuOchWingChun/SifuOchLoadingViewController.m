//
//  SifuOchLoadingViewController.m
//  SifuOchWingChun
//
//  Created by Beesabathini,Rajanikanth on 5/9/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchLoadingViewController.h"

@interface SifuOchLoadingViewController ()

@end

@implementation SifuOchLoadingViewController

- (id)init {
    if (!(self = [super init])) return  nil;

    return self;
}

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view setFrame:CGRectMake(0, 0, 20, 20)];

    self.loadingGraphic = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.loadingGraphic setHidden:NO];
    [self.view addSubview:self.loadingGraphic];
    [self.loadingGraphic startAnimating];
}

@end
