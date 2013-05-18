//
//  SifuOchLoadingView.m
//  SifuOchWingChun
//
//  Created by Beesabathini,Rajanikanth on 5/9/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchLoadingViewController.h"

@interface SifuOchLoadingView ()

@end

@implementation SifuOchLoadingView

- (id)init {
    if (!(self = [super init])) return  nil;
    [self setBackgroundColor:[UIColor blackColor]];
    self.frame = [[UIScreen mainScreen] bounds];
    self.alpha = 0.4;
    
    return self;
}

- (void)start {
    if (!self.loadingGraphic) {
        self.loadingGraphic = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    
    [self.loadingGraphic setHidden:NO];
    [self.loadingGraphic setBackgroundColor:[UIColor clearColor]];
    [self.loadingGraphic setFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height/2, 30, 30)];
    [self addSubview:self.loadingGraphic];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [self.loadingGraphic startAnimating];
}

- (void)stop {
    [self.loadingGraphic stopAnimating];
    [self removeFromSuperview];
}

@end
