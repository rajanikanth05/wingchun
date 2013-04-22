//
//  SifuOchDescriptionViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/8/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SifuOchSashObject.h"

@interface SifuOchDescriptionViewController : UIViewController

@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) IBOutlet UITextView *descriptionView;
@property(nonatomic, retain) SifuOchSashObject *sashItem;
@property(nonatomic, retain) IBOutlet UIButton *backButton;
@property(nonatomic, retain) IBOutlet UINavigationItem *navItem;

- (IBAction)goBack:(id)sender;
@end
