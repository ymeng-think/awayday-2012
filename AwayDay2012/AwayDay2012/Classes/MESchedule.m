//
//  MESchedule.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESchedule.h"

@implementation MESchedule

@synthesize title, comment, from, to, scheduledOn;

- initWithTitle:(NSString *)_title from:(CGFloat)_from to:(CGFloat)_to {
    self = [super init];
    if (self) {
        self->title = [_title copy];
        self->from = _from;
        self->to = _to;
    }
    
    return self;
}

- (void)dealloc {
    [title release];
    [comment release];
    
    [super dealloc];
}

@end
