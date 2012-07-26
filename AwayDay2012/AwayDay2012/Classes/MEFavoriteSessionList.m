//
//  MESessionList.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/16/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEFavoriteSessionList.h"
#import "MEDate.h"
#import "MESchedule.h"

@interface MEFavoriteSessionList ()

+ (NSString *)date2Key:(MEDate)date;

@end

@implementation MEFavoriteSessionList

- (id)init {
    self = [super init];
    if (self) {
        self->dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addSession:(NSString *)name on:(MEDate)date {
    NSString *key = [[self class] date2Key:date];
    if (![dict valueForKey:key]) {
        NSMutableArray *sessionList = [[NSMutableArray alloc] init];
        [dict setValue:sessionList forKey:key];
        [sessionList release];
    }
    
    NSMutableArray *sessionList = [dict objectForKey:key];
    [sessionList addObject:name];
}

- (void)removeSession:(NSString *)name on:(MEDate)date {
    if (![self containsSession:name on:date]) {
        return;
    }
    
    NSString *key = [[self class] date2Key:date];
    NSMutableArray *sessionList = [dict objectForKey:key];
    [sessionList removeObject:name];
    if (sessionList.count == 0) {
        [dict removeObjectForKey:key];
    }
}

- (BOOL)containsSession:(NSString *)name on:(MEDate)date {
    NSString *key = [[self class] date2Key:date];
    if (![dict valueForKey:key]) {
        return NO;
    }
    
    NSMutableArray *sessionList = [dict objectForKey:key];
    if (![sessionList containsObject:name]) {
        return NO;
    }
    
    return YES;
}

- (void)writeToFile:(NSString *)filePath {
    [self->dict writeToFile:filePath atomically:YES];
}

- (void)reloadFromFile:(NSString *)filePath {
    [self->dict release];
    self->dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
}

+ (NSString *)date2Key:(MEDate)date {
    return [NSString stringWithFormat:@"%4i/%02i/%02i", date.year, date.month, date.day];
}

- (void)dealloc {
    [self->dict release];
    
    [super dealloc];
}

@end
