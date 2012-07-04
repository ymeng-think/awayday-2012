//
//  MEAgendaLoader.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/3/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaLoader.h"
#import "MEAgenda.h"
#import "MEAgendaList.h"
#import "MEDate.h"
#import "MESchedule.h"

#define COMMENT_PREFIX              '#'
#define FILE_EXTENSION              @"txt"
#define LINE_LIMITER                @"\n"
#define KEY_VALUE_SEPARATOR         @":"
#define DATE_COMPONENT_SEPRARTOR    @"/"

#define KEY_PREFIX_DATE             @"date"
#define KEY_PREFIX_SCHEDULE         @"schedule"
#define KEY_PREFIX_SCHEDULE_TITLE   @"title"
#define KEY_PREFIX_SCHEDULE_COMMENT @"comment"
#define KEY_PREFIX_SCHEDULE_FROM    @"from"
#define KEY_PREFIX_SCHEDULE_TO      @"to"

typedef struct {
    NSString *key;
    NSString *value;
} MEKeyValue;

@interface MEAgendaLoader ()

- (NSString *)trimWhitespace:(NSString *)line;
- (BOOL)isBlank:(NSString *)line;
- (BOOL)isComment:(NSString *)line;
- (void)parse:(NSString *)line;
- (BOOL)string:(NSString *)str prefixWith:(NSString *)prefix caseInsensitive:(BOOL)ignoreCase;
- (BOOL)shouldStartNewAgenda:(NSString *)line;
- (BOOL)shouldStartNewSchedule:(NSString *)line;
- (MESchedule *)createScheduleAccordingTo:(NSDictionary *)info;
- (MEKeyValue)breakLineToKeyValue:(NSString *)line;
- (MEDate)parseToDate:(NSString *)line;
- (void)parseAgendaFromString:(NSString *)line andAddToList:(MEAgendaList *)list;
- (void)buildScheduleFromLastInfoAndAddToAgenda:(MEAgenda *)agenda;
- (void)parseScheduleInfoFromString:(NSString *)line;

@end

@implementation MEAgendaLoader

- (id)init {
    self = [super init];
    if (self) {
        agendaList = [[MEAgendaList alloc] init];
    }
    return self;
}

- (MEAgendaList *)loadFromFile:(NSString *)fileName {    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:FILE_EXTENSION];  
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath 
                                                       encoding:NSASCIIStringEncoding error:NULL];
    
    NSArray *lines = [fileContent componentsSeparatedByString:LINE_LIMITER];
    [fileContent release];
    
    NSEnumerator *nse = [lines objectEnumerator];
    NSString *line;
    while (line = [nse nextObject]) {
        line = [self trimWhitespace:line];
        
        if ([self isBlank:line] || [self isComment:line]) {
            continue;
        }
        
        [self parse:line];
    }
    
    if (lastScheduleInfo) {
        [lastAgenda addSchedule:[self createScheduleAccordingTo:lastScheduleInfo]];
    }
    if (lastAgenda) {
        [agendaList add:lastAgenda];
    }
    
    return agendaList;
}

- (NSString *)trimWhitespace:(NSString *)line {
    return [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isBlank:(NSString *)line {
    return line.length == 0;
}

- (BOOL)isComment:(NSString *)line {
    return [line characterAtIndex:0] == COMMENT_PREFIX;
}

- (void)parse:(NSString *)line {
    if ([self shouldStartNewAgenda:line]) {
        [self parseAgendaFromString:line andAddToList:agendaList];
        isParsingSchedule = NO;
    } else if ([self shouldStartNewSchedule:line]) {
        [self buildScheduleFromLastInfoAndAddToAgenda:lastAgenda];
        isParsingSchedule = YES;
    } else if (isParsingSchedule) {
        [self parseScheduleInfoFromString:line];
    }
}

- (BOOL)string:(NSString *)str prefixWith:(NSString *)prefix caseInsensitive:(BOOL)ignoreCase {
    if (ignoreCase) {
        str = [str lowercaseString];
        prefix = [prefix lowercaseString];
    }
    
    return [str hasPrefix:prefix];
}

- (BOOL)shouldStartNewAgenda:(NSString *)line {
    return [self string:line prefixWith:KEY_PREFIX_DATE caseInsensitive:YES];
}

- (BOOL)shouldStartNewSchedule:(NSString *)line {
    return [self string:line prefixWith:KEY_PREFIX_SCHEDULE caseInsensitive:YES];
}

- (MESchedule *)createScheduleAccordingTo:(NSDictionary *)info {
    NSString *title = [info objectForKey:KEY_PREFIX_SCHEDULE_TITLE];
    CGFloat from = [((NSNumber *)[info objectForKey:KEY_PREFIX_SCHEDULE_FROM]) floatValue];
    CGFloat to = [((NSNumber *)[info objectForKey:KEY_PREFIX_SCHEDULE_TO]) floatValue];
    NSString *comment = [info objectForKey:KEY_PREFIX_SCHEDULE_COMMENT];
    
    MESchedule *schedule = [MESchedule schedule:title from:from to:to];
    schedule.comment = comment;
    return schedule;
}

- (MEKeyValue)breakLineToKeyValue:(NSString *)line {
    NSArray *items = [line componentsSeparatedByString:KEY_VALUE_SEPARATOR];
    NSString *key = [items objectAtIndex:0];
    NSString *value = [items objectAtIndex:1];
    
    MEKeyValue result;
    result.key = [self trimWhitespace:key];
    result.value = [self trimWhitespace:value];
    return result;
}

- (MEDate)parseToDate:(NSString *)line {
    MEKeyValue info = [self breakLineToKeyValue:line];
    NSString *dateStr = info.value;
    
    NSArray *components = [dateStr componentsSeparatedByString:DATE_COMPONENT_SEPRARTOR];
    NSString *year = [components objectAtIndex:0];
    NSString *month = [components objectAtIndex:1];
    NSString *day = [components objectAtIndex:2];
    
    return MEDateMake([year integerValue], [month integerValue], [day integerValue]);
}

- (void)parseAgendaFromString:(NSString *)line andAddToList:(MEAgendaList *)list {
    if (lastAgenda) {
        [self buildScheduleFromLastInfoAndAddToAgenda:lastAgenda];        
        [list add:lastAgenda];
        
        [lastAgenda release];
        lastAgenda = nil;
    }
    
    lastAgenda = [[MEAgenda alloc] initOnDate:[self parseToDate:line]];
}

- (void)buildScheduleFromLastInfoAndAddToAgenda:(MEAgenda *)agenda {
    if (lastScheduleInfo) {
        [agenda addSchedule:[self createScheduleAccordingTo:lastScheduleInfo]];
        
        [lastScheduleInfo release];
        lastScheduleInfo = nil;
    }
}

- (void)parseScheduleInfoFromString:(NSString *)line {
    if (!lastScheduleInfo) {
        lastScheduleInfo = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    MEKeyValue parsed = [self breakLineToKeyValue:line];
    [lastScheduleInfo setObject:parsed.value forKey:[parsed.key lowercaseString]];
}

- (void)dealloc {
    [lastScheduleInfo release];
    [lastAgenda release];
    [agendaList release];
    
    [super dealloc];
}

@end
