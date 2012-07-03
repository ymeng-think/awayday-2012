//
//  MEAgendaView.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEDate.h"

@class MEAgendaView, MEScheduleCell;

@protocol MEAgendaDelegate

- (NSInteger)agenda:(MEAgendaView *)agendaView scheduleNumInAgenda:(NSInteger)index;
- (void)agenda:(MEAgendaView *)agendaView cell:(MEScheduleCell *)cell atIndex:(NSInteger)index inDay:(MEDate)date;
- (MEDate)agenda:(MEAgendaView *)agendaView dateAtIndex:(NSInteger)index;

@end

@interface MEAgendaView : UIView <UITableViewDataSource> {
    UITableView *plan;
    
    id<NSObject, MEAgendaDelegate> delegate;
}

@property (nonatomic, retain) id<NSObject, MEAgendaDelegate> delegate;

@end
