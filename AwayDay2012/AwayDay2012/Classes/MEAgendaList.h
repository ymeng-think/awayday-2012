//
//  MEAgendaList.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEDate.h"

@class MEAgenda;

@interface MEAgendaList : NSObject {
    NSMutableArray *list;
}

- (void)add:(MEAgenda *)agenda;
- (MEAgenda *)findByDate:(MEDate)date;

@end
