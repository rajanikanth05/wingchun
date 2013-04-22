//
//  SifuOchAPIRequest.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/14/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SifuOchXMLParser.h"

@interface SifuOchAPIRequest : NSObject<NSURLConnectionDelegate> {
    // DEPRECATED - api credentials -
    NSString *apiKey;
    NSString *apiID;
    
    // api credentials
    NSString *kioskID;
    NSString *kioskToken;
    
    NSString *responseData;
    NSString *const base_url;
    NSString *const payment_url;
    
    NSString *postString;
    
    NSURLConnection *apiConnection;
    NSMutableURLRequest *apiRequest;
    
    NSURLConnection *processingConnection;
    NSMutableURLRequest *processingRequest;
    
    NSURLConnection *hobnobConnection;
    NSMutableURLRequest *hobnobRequest;
    
    enum { STAGING_ENVIRONMENT = 99, SECURE_ENVIRONMENT = 100 };
    int environment;
    
    SifuOchXMLParser *xmlParser;
    
    enum { CONTROL_SYSTEM_VIRTUAL_TERMINAL = 1, CONTROL_SYSTEM_KIOSK = 2 };
    int currentSystem;
}

@property (retain) NSString *apiKey;
@property (retain) NSString *apiID;

@property (retain) NSString *kioskID;
@property (retain) NSString *kioskToken;

@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSString *const base_url;
@property (nonatomic, retain) NSString *const payment_url;
@property (nonatomic, retain) NSString *postString;

@property (nonatomic, retain) NSURLConnection *apiConnection;
@property (nonatomic, retain) NSURLConnection *processingConnection;
@property (nonatomic, retain) NSURLConnection *hobnobConnection;

@property (nonatomic, retain) NSMutableURLRequest *apiRequest;
@property (nonatomic, retain) NSMutableURLRequest *processingRequest;
@property (nonatomic, retain) NSMutableURLRequest *hobnobRequest;

@property (nonatomic, retain) SifuOchXMLParser *xmlParser;

@property (nonatomic) int environment;
@property (nonatomic) int currentSystem;

- (NSMutableArray *)makeRequest:(NSString *)url data:(NSString *)pString;


@end
