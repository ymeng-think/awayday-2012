//
//  MEAgendaList.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaList.h"
#import "MEAgenda.h"

@implementation MEAgendaList 

- (id)init {
    self = [super init];
    if (self) {
        self->list = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;
}

- (void)add:(MEAgenda *)agenda {
    [list addObject:agenda];
}

- (MEAgenda *)findByDate:(MEDate)date {
    for (MEAgenda *agenda in list) {
        if ([agenda onSameDate:date]) {
            return agenda;
        }
    }
    return nil;
}

- (void)dealloc {
    [self->list release];
    
    [super dealloc];
}

@end
