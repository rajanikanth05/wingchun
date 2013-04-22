//
//  SifuOchAppDelegate.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SifuOchAPIRequest.h"

@interface SifuOchAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) SifuOchAPIRequest *apiHandler;
@end
