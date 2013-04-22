//
//  SifuOchConnectViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/28/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface SifuOchConnectViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIButton *facebook;
@property(nonatomic, retain) IBOutlet UIButton *twitter;
@property(nonatomic, retain) IBOutlet UIButton *pinterest;
@property(nonatomic, retain) IBOutlet UIButton *instagram;
@property(nonatomic, retain) IBOutlet UIButton *foursquare;
@property(nonatomic, retain) IBOutlet UIButton *googleplus;
@property(nonatomic, retain) UIView *fbView;
@property(nonatomic, retain) IBOutlet UIView *twView;
@property(nonatomic) int currentTag;

- (IBAction)connectSocial:(id)sender;
- (IBAction)connectWithTwitter:(id)sender;
- (IBAction)connectWithInstagram:(id)sender;
- (IBAction)connectWithPinterest:(id)sender;

@end
