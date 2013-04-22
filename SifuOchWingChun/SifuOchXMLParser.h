//
//  SifuOchXMLParser.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/14/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface SifuOchXMLParser : NSObject {
    NSMutableDictionary *parsedData;
    NSMutableArray *youtubeVideos;
    NSMutableArray *articles;
}

@property (nonatomic, retain) NSMutableDictionary *parsedData;
@property (nonatomic, retain) NSMutableArray *youtubeVideos;
@property (nonatomic, retain) NSMutableArray *articles;

- (NSMutableArray *)parseData:(NSData *)data;
- (void)parseErrors:(TBXMLElement *)tbxml;

@end
