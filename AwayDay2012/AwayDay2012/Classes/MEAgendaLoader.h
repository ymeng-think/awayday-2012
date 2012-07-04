//
//  MEAgendaLoader.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/3/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MEAgendaList;

@class MEAgendaList, MEAgenda;

@interface MEAgendaLoader : NSObject {
    MEAgendaList *agendaList;    
    MEAgenda *lastAgenda;
    NSMutableDictionary *lastScheduleInfo;
    
    BOOL isParsingSchedule;
}

- (MEAgendaList *)loadFromFile:(NSString *)file;

@end
