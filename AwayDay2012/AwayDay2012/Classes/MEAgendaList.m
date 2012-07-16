//
//  MEAgendaList.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaList.h"
#import "MEAgenda.h"
#import "MESchedule.h"

@interface MEAgendaList ()

- (void)onlyCopySessionFrom:(MEAgenda *)from to:(MEAgenda *)to;

@end

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

- (NSInteger)count {
    return self->list.count;
}

- (MEAgenda *)agendaAtIndex:(NSInteger)index {
    return [self->list objectAtIndex:index];
}

- (MEAgendaList *)onlySessionList {
    MEAgendaList *sessionList = [[[MEAgendaList alloc] init] autorelease];
    
    for (MEAgenda *agenda in self->list) {
        if (agenda.sessionCount > 0) {
            MEAgenda *sessionAgenda = [[MEAgenda alloc] initOnDate:agenda.date];
            [self onlyCopySessionFrom:agenda to:sessionAgenda];
            [sessionList add:sessionAgenda];
            [sessionAgenda release];
        }
    }
    
    return sessionList;
}

- (void)onlyCopySessionFrom:(MEAgenda *)from to:(MEAgenda *)to {
    for (NSInteger i = 0; i < from.scheduleCount; i++) {
        MESchedule *schedule = [from scheduleAt:i];
        if (schedule.isSession) {
            [to addSchedule:schedule];
        }
    }
}

- (void)dealloc {
    [self->list release];
    
    [super dealloc];
}

@end
