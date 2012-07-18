//
//  MESessionList.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/16/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEDate.h"

@class MESchedule;

@interface MESessionList : NSObject {
    NSMutableArray *list;
}

- (void)addSession:(MESchedule *)schedule;
- (void)removeSession:(MESchedule *)schedule;
- (BOOL)containsSession:(NSString *)title on:(MEDate)date;

@end
