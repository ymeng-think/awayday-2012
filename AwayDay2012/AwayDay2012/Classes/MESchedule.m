//
//  MESchedule.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESchedule.h"

@implementation MESchedule

@synthesize title, comment, from, to;

+ (id)schedule:(NSString *)title from:(CGFloat)from to:(CGFloat)to {
    MESchedule *schedule = [[[MESchedule alloc] init] autorelease];
    schedule->title = title;
    schedule->from = from;
    schedule->to = to;
    
    return schedule;
}

- (void)dealloc {
    [title release];
    [comment release];
    
    [super dealloc];
}

@end
