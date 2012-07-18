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

- (NSInteger)numberOfAgenda:(MEAgendaView *)agendaView;
- (NSInteger)agenda:(MEAgendaView *)agendaView scheduleNumInAgenda:(NSInteger)index;
- (void)agenda:(MEAgendaView *)agendaView cell:(MEScheduleCell *)cell atScheduleIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex;
- (MEDate)agenda:(MEAgendaView *)agendaView dateAtIndex:(NSInteger)index;

@optional
- (void)agenda:(MEAgendaView *)agendaView exposeScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex;
- (void)agenda:(MEAgendaView *)agendaView didSelectScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex;
- (void)agenda:(MEAgendaView *)agendaView didDeselectScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex;

@end

@interface MEAgendaView : UIView <UITableViewDataSource, UITableViewDelegate> {
    UITableView *plan;
    
    id<NSObject, MEAgendaDelegate> delegate;
}

@property (nonatomic, retain) id<NSObject, MEAgendaDelegate> delegate;

- (void)startToSelectFavoriteSession;
- (void)confirmFavoriteSession;

@end
