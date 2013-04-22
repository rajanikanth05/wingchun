//
//  SifuOchDatabase.h
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/9/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SifuOchDatabase : NSObject

@property(nonatomic) sqlite3 *wingChunDatabase;
@property(nonatomic, retain) NSString *databasePath;
@property(nonatomic, retain) NSMutableArray *techniques;
+ (SifuOchDatabase *)sharedDatabase;
- (void)createDatabase;

- (NSMutableArray *)getDataForSash:(int)sash;
@end
