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

- (id)initOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
- (void)addSchedule:(MESchedule *)schedule;
- (NSInteger)scheduleCount;
- (MESchedule *)scheduleAt:(NSInteger)index;
- (BOOL)onSameDate:(MEDate)date;

@end
