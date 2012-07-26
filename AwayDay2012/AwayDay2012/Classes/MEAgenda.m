//
//  MEAgenda.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgenda.h"
#import "MESchedule.h"
#import "MESession.h"

@interface MEAgenda ()

@end

@implementation MEAgenda
@synthesize date;

- (id)initOnDate:(MEDate)_date {
    self = [super init];
    if (self) {
        self->date = _date;
        self->scheduleList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addSchedule:(MESchedule *)schedule {
    schedule.scheduledOn = self->date;
    [scheduleList addObject:schedule];
}

- (NSInteger)scheduleCount {
    return scheduleList.count;
}

- (NSInteger)sessionCount {
    NSInteger sessionCount = 0;
    for (MESchedule *schedule in scheduleList) {
        if ([schedule isKindOfClass:[MESession class]]) {
            
            sessionCount++;
        }
    }
    return sessionCount;
}

- (MESchedule *)scheduleAt:(NSInteger)index {
    if (index >= [self scheduleCount]) {
        return nil;
    }
    return [scheduleList objectAtIndex:index];
}

- (BOOL)onSameDate:(MEDate)d {
    return self->date.year == d.year && 
           self->date.month == d.month && 
           self->date.day == d.day;
}

- (void)dealloc {
    [self->scheduleList release];
    
    [super dealloc];
}

@end
