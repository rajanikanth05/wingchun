//
//  SifuOchYoutubeChannel.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/15/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SifuOchYoutubeChannel : NSObject {
    NSString *title;
    NSString *url;
    NSString *dateAdded;
    NSString *dateUpdated;
    NSString *author;
    NSString *videoId;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *dateAdded;
@property(nonatomic, retain) NSString *dateUpdated;
@property(nonatomic, retain) NSString *author;
@property(nonatomic, retain) NSString *videoId;

@end
