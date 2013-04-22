//
//  SifuOchXMLParser.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/14/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchXMLParser.h"
#import "SifuOchYoutubeChannel.h"
#import "SifuOchArticle.h"
#import "TBXML.h"

@implementation SifuOchXMLParser

@synthesize parsedData = _parsedData;

- (id)init {
    self = [super init];
    
    if (self) {
        _parsedData = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSMutableArray *)parseData:(NSData *)data {
    [[self parsedData] removeAllObjects];
    
    NSError *error;
    TBXML *tbxml = [TBXML newTBXMLWithXMLData:data error:&error];
    
    if (error) {
        //NSLog(@"%@ %@", [error localizedDescription], [error userInfo]);
    } else {
        if ([[TBXML elementName:tbxml.rootXMLElement] isEqualToString:@"feed"]) {
           return [self parseYoutubeChannel:tbxml.rootXMLElement];
        } else if ([[TBXML elementName:tbxml.rootXMLElement] isEqualToString:@"aarticles"]) {
            return [self parseYoutubeChannel:tbxml.rootXMLElement];
        }
    }
    return nil;
}

- (NSMutableArray *) parseYoutubeChannel:(TBXMLElement *)feed {
    TBXMLElement *element = feed->firstChild;
    _youtubeVideos = [[NSMutableArray alloc] init];
    do {
        if (strncmp(element->name, "element", strlen("element")) == 0) {
            SifuOchYoutubeChannel *vid = [[SifuOchYoutubeChannel alloc] init];
            TBXMLElement *subElement = element->firstChild;
            do {
                if (strncmp(subElement->name, "title", strlen("title")) == 0) {
                    [vid setTitle:[TBXML textForElement:subElement]];
                } else if (strncmp(subElement->name, "link", strlen("link")) == 0) {
                    [vid setUrl:[TBXML valueOfAttributeNamed:@"href" forElement:subElement]];
                }
            } while ((subElement = subElement->nextSibling));
            [_youtubeVideos addObject:vid];
        }
    } while ((element = element->nextSibling)) ;
    
    return _youtubeVideos;
}

- (NSMutableArray *) parseArticles:(TBXMLElement *)feed {
    TBXMLElement *element = feed->firstChild;
    _articles = [[NSMutableArray alloc] init];
    do {
        if (strncmp(element->name, "article", strlen("article")) == 0) {
            SifuOchArticle *articleObj = [[SifuOchArticle alloc] init];
            TBXMLElement *subElement = element->firstChild;
            do {
                if (strncmp(subElement->name, "title", strlen("title")) == 0) {
                    [articleObj setTitle:[TBXML textForElement:subElement]];
                } else if (strncmp(subElement->name, "url", strlen("url")) == 0) {
                    [articleObj setUrl:[TBXML valueOfAttributeNamed:@"href" forElement:subElement]];
                } else if (strncmp(subElement->name, "image", strlen("image")) == 0) {
                    [articleObj setLogo:[TBXML textForElement:subElement]];
                } else if (strncmp(subElement->name, "description", strlen("description")) == 0) {
                    [articleObj setDescription:[TBXML textForElement:subElement]];
                } else if (strncmp(subElement->name, "id", strlen("id")) == 0) {
                    [articleObj setArticleId:[TBXML textForElement:subElement]];
                }
            } while ((subElement = subElement->nextSibling));
            [_articles addObject:articleObj];
        }
    } while ((element = element->nextSibling)) ;
    
    return _articles;
}

@end
