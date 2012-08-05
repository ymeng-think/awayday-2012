//
//  MECalendar.m
//  AwayDay2012
//
//  Created by Meng Yu on 8/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import <EventKit/EventKit.h>
#import "MEDate.h"
#import "MESession.h"

static MECalendar *gSharedInstance;

@interface MECalendar ()

+ (NSDate *)buildNSDateWith:(MEDate)date and:(CGFloat)time;

@end

@implementation MECalendar

- (id)init {
    self = [super init];
    if (self) {
        eventStore = [[EKEventStore alloc] init];
    }
    return self;
}

- (void)addSessionEvent:(MESession *)session {
    EKEvent *addEvent = [EKEvent eventWithEventStore:eventStore];
    addEvent.title = session.title;
    addEvent.startDate = [[self class] buildNSDateWith:session.scheduledOn and:session.from];
    addEvent.endDate = [[self class] buildNSDateWith:session.scheduledOn and:session.to];
    [addEvent setCalendar:[eventStore defaultCalendarForNewEvents]];
    
    NSDate *alarmTime = [addEvent.startDate dateByAddingTimeInterval:-600];
    [addEvent addAlarm:[EKAlarm alarmWithAbsoluteDate:alarmTime]];
    
    NSError *error;
    [eventStore saveEvent:addEvent span:EKSpanThisEvent commit:YES error:&error];
}

+ (MECalendar *)shared {
    if (!gSharedInstance) {
        gSharedInstance = [[MECalendar alloc] init];
    }
    return gSharedInstance;
}

+ (NSDate *)buildNSDateWith:(MEDate)date and:(CGFloat)time {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = date.year;
    components.month = date.month;
    components.day = date.day;
    components.hour = (NSInteger)time;
    components.minute = (NSInteger)((time - (NSInteger)time + 0.001) * 100);
    
    NSDate *standardDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    [components release];
    
    return standardDate;
}

@end
