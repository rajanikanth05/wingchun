//
//  SifuOchDatabase.m
//  SifuOchWingChun
//
//  Created by Rajanikanth Beesabathini on 3/9/13.
//  Copyright (c) 2013 SifuOchWingChun. All rights reserved.
//

#import "SifuOchDatabase.h"
#import "SifuOchSashObject.h"

@implementation SifuOchDatabase

static SifuOchDatabase *sharedDatabase = nil;

+ (SifuOchDatabase *)sharedDatabase {
    if (sharedDatabase == nil) {
        sharedDatabase = [[SifuOchDatabase alloc] init];
    }
    return sharedDatabase;
}

- (void)createDatabase {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSMutableArray *errors = [[NSMutableArray alloc] init];

    _databasePath = [[NSString alloc]initWithString:[documentsDirectory stringByAppendingPathComponent:@"wingchun.db"]];

    if ([[NSFileManager defaultManager] fileExistsAtPath:_databasePath] == FALSE) {
        if (sqlite3_open([_databasePath UTF8String], &_wingChunDatabase) == SQLITE_OK) {
            char *error;
            const char *sqlStatement = nil;
            sqlStatement = "CREATE TABLE IF NOT EXISTS Techniques (id INTEGER, title TEXT, description TEXT, url TEXT, type INTEGER, sash INTEGER)";
            sqlite3_exec(_wingChunDatabase, sqlStatement, NULL, NULL, &error);
            if (error) { [errors addObject:[NSString stringWithFormat:@"%s", error]]; error = nil; }
            
            sqlite3_close(_wingChunDatabase);
        }
    }
    if ([errors count]) {
        NSLog(@"Database creation errors : %@", errors);
    }
}

- (NSMutableArray *)getDataForSash:(int)sash {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    _databasePath = [[NSString alloc]initWithString:[documentsDirectory stringByAppendingPathComponent:@"wingchun.db"]];
    NSMutableArray *technique = [[NSMutableArray alloc] init];
    const char *dbpath = [[self databasePath] UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_wingChunDatabase) == SQLITE_OK) {
        const char *query_stmt = [@"SELECT title, description, url FROM techniques" UTF8String];
        
        if (sqlite3_prepare_v2(_wingChunDatabase, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            int stepResult = sqlite3_step(statement);
            
            NSString *resultString;
            NSString *columnName = nil;
            while (stepResult == SQLITE_ROW) {
                //for (int i = 0; i < sqlite3_data_count(statement); ++i) {
                SifuOchSashObject *obj = [[SifuOchSashObject alloc] init];

                    [obj setTitle:[NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 0)]];
                    [obj setDescription:[NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 1)]];
                    [obj setUrl:[NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 2)]];
                    [technique addObject:obj];
                NSLog(@"%@", [(SifuOchSashObject *)[technique objectAtIndex:[technique count] - 1] title]);
       /*             if (sqlite3_column_text(statement, i)) {
                        resultString = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, i)];
                        NSLog(@"%@", resultString);
                    } else {
                        resultString = nil;
                    }
                    
                    if (sqlite3_column_name(statement, i)) {
                        columnName = [NSString stringWithUTF8String:(const char *) sqlite3_column_name(statement, i)];
                    }
                    
                    if (columnName) {
                        [result setValue:resultString forKey:columnName];
                    }
                    */
                    resultString = nil;
                    columnName = nil;
                //}
                
                stepResult = sqlite3_step(statement);
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(_wingChunDatabase);
        }
        for (int i =0; i < [technique count]; i++) {
            NSLog(@"%@", [(SifuOchSashObject *)[technique objectAtIndex:i] title]);
        }
    }
    return technique;

}
@end
