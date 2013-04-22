//
//  SifuOchContactViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/7/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SifuOchContactViewController : UITableViewController<MFMailComposeViewControllerDelegate>

@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *phone;
@property(nonatomic, retain) NSString *message;

@property(nonatomic, retain) IBOutlet UITextField *firstNameField;
@property(nonatomic, retain) IBOutlet UITextField *lastNameField;
@property(nonatomic, retain) IBOutlet UITextField *emailField;
@property(nonatomic, retain) IBOutlet UITextField *phoneField;
@property(nonatomic, retain) IBOutlet UITextView *messageField;

-(IBAction)sendEmail:(id)sender;
@end
