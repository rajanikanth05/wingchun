//
//  SifuOchWebViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/26/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SifuOchWebViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic, retain) NSString *webUrl;
@end
