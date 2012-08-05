//
//  MECalendar.h
//  AwayDay2012
//
//  Created by Meng Yu on 8/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKEventStore, MESession;

@interface MECalendar : NSObject {
    EKEventStore *eventStore;

}

+ (MECalendar *)shared;
- (void)addSessionEvent:(MESession *)session;

@end
