//
//  SifuOchArticle.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/21/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SifuOchArticle : NSObject {
    NSString *articleId;
    NSString *url;
    NSString *title;
    NSString *logo;
    NSString *description;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *articleId;
@property(nonatomic, retain) NSString *logo;
@property(nonatomic, retain) NSString *description;

@end
