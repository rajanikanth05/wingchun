//
//  SifuOchAPIRequest.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 4/14/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchAPIRequest.h"

@interface SifuOchAPIRequest()
- (NSString *)getAPICredentialString:(NSString *)rest;
@end

@implementation SifuOchAPIRequest


@synthesize apiKey, apiID, kioskID, kioskToken;
@synthesize responseData, base_url, payment_url;
@synthesize postString = _postString;
@synthesize apiConnection = _apiConnection;
@synthesize processingConnection = _processingConnection;
@synthesize apiRequest = _apiRequest;
@synthesize processingRequest = _processingRequest;
@synthesize hobnobConnection = _hobnobConnection;
@synthesize hobnobRequest = _hobnobRequest;
@synthesize environment;
@synthesize xmlParser = _xmlParser;
@synthesize currentSystem;

- init {
    self = [super init];
    
    if (self) {
        _xmlParser = [[SifuOchXMLParser alloc] init];
    }
    return self;
}

#pragma mark - Network request
- (NSMutableArray *)makeRequest:(NSString *)url data:(NSString *)pString {
    if (!_apiConnection) {
        _apiRequest = [[NSMutableURLRequest alloc] init];
        
        [_apiRequest setValue:@"application/atom+xml" forHTTPHeaderField:@"Content-Type"];
        [_apiRequest setHTTPMethod:@"POST"];
        [_apiRequest setTimeoutInterval:30];
        [_apiRequest setHTTPShouldUsePipelining:NO];
    }
    
    if (!_apiConnection) {
        _apiConnection = [[NSURLConnection alloc] initWithRequest:_apiRequest delegate:self startImmediately:YES];
    }
    
    [_apiRequest setURL:[NSURL URLWithString:url]];
    [_apiRequest setHTTPBody:[_postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse* response;
    NSError *error = nil;
    NSData *result = nil;
    
    result = [NSURLConnection sendSynchronousRequest:[self apiRequest] returningResponse:&response error:&error];
    
    NSLog(@"APIHandler::makeRequest: result : %@", [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding]);
    
    NSMutableArray *results;
    
    if (error) {
        NSArray *errors = [[NSArray alloc] initWithObjects:[[error userInfo] valueForKey:@"NSLocalizedDescription"], nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"api.RequestErred" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errors, @"errors", nil]];
        
        
        return nil;
    } else {
        results = [_xmlParser parseData:result];
    }
    
    return results;
}

@end
