//
//  MEAgenda.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgenda.h"
#import "MESchedule.h"

@interface MEAgenda ()

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end

@implementation MEAgenda

- (id)initOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    self = [super init];
    if (self) {
        self->date = [MEAgenda dateWithYear:year month:month day:day];
        self->scheduleList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addSchedule:(MESchedule *)schedule {
    [scheduleList addObject:schedule];
}

- (NSInteger)scheduleCount {
    return scheduleList.count;
}

- (MESchedule *)scheduleAt:(NSInteger)index {
    if (index >= [self scheduleCount]) {
        return nil;
    }
    return [scheduleList objectAtIndex:index];
}

- (void)dealloc {
    [self->scheduleList release];
    
    [super dealloc];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    NSDate *date = [calendar dateFromComponents:components];
    [components release];
    
    return date;
}

@end
