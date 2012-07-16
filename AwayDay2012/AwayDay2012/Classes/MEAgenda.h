//
//  MEAgenda.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEDate.h"

@class MESchedule;

@interface MEAgenda : NSObject {
    MEDate date;
    NSMutableArray *scheduleList;
}

@property (nonatomic, readonly) MEDate date;

- (id)initOnDate:(MEDate)date;
- (void)addSchedule:(MESchedule *)schedule;
- (NSInteger)scheduleCount;
- (NSInteger)sessionCount;
- (MESchedule *)scheduleAt:(NSInteger)index;
- (BOOL)onSameDate:(MEDate)date;

@end
