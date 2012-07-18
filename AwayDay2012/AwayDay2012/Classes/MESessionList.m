//
//  MESessionList.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/16/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESessionList.h"
#import "MESchedule.h"

@implementation MESessionList

- (id)init {
    self = [super init];
    if (self) {
        self->list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addSession:(MESchedule *)schedule {
    NSAssert(schedule != nil, @"Schedule object should NOT be nil.");
    NSAssert(schedule.isSession, @"Schedule object should be a session.");
    
    [self->list addObject:schedule];
}

- (void)removeSession:(MESchedule *)schedule {
    [self->list removeObject:schedule];
}

- (BOOL)containsSession:(NSString *)title on:(MEDate)date {
    for (MESchedule *schedule in self->list) {
        if (MEDateEqual(schedule.scheduledOn, date) && [schedule.title isEqualToString:title]) {
            return YES;
        }
    }
    return NO;
}

- (void)dealloc {
    [self->list release];
    
    [super dealloc];
}

@end
