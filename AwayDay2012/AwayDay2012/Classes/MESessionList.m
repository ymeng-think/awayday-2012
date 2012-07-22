//
//  MESessionList.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/16/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESessionList.h"
#import "MEDate.h"
#import "MESchedule.h"

@interface MESessionList ()

+ (NSString *)date2Key:(MEDate)date;

@end

@implementation MESessionList

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
        NSMutableSet *sessionList = [[NSMutableSet alloc] init];
        [dict setValue:sessionList forKey:key];
        [sessionList release];
    }
    
    NSMutableSet *sessionList = [dict objectForKey:key];
    [sessionList addObject:name];
}

- (void)removeSession:(NSString *)name on:(MEDate)date {
    if (![self containsSession:name on:date]) {
        return;
    }
    
    NSString *key = [[self class] date2Key:date];
    NSMutableSet *sessionList = [dict objectForKey:key];
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
    
    NSMutableSet *sessionList = [dict objectForKey:key];
    if (![sessionList containsObject:name]) {
        return NO;
    }
    
    return YES;
}

+ (NSString *)date2Key:(MEDate)date {
    return NSStringFromMEDate(date);
}

- (void)dealloc {
    [self->dict release];
    
    [super dealloc];
}

@end
