//
//  SifuOchLoadingView.h
//  SifuOchWingChun
//
//  Created by Beesabathini,Rajanikanth on 5/9/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SifuOchLoadingView : UIView

@property (retain, nonatomic) UIActivityIndicatorView *loadingGraphic;

- (void)start;
- (void)stop;

@end
