//
//  SifuOchHomeViewController.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/27/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SifuOchHomeViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic, retain) IBOutlet UIScrollView *tabBar;
@property(nonatomic, retain) NSMutableArray *tabBarItems;
@property(nonatomic, retain) NSMutableArray *tabBarItemViews;


@end
