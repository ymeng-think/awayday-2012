//
//  MEAgendaController.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaController.h"
#import "MEAgenda.h"
#import "MEAgendaList.h"
#import "MESchedule.h"
#import "MEScheduleCell.h"

#define TAB_NAME @"AGENDA"

@interface MEAgendaController ()

+ (MEAgenda *)agendaGenerator;
- (BOOL)isValidIndexOfAgendaList:(NSInteger)index;

@end

@implementation MEAgendaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = TAB_NAME;
        
        agendaList = [[MEAgendaList alloc] init];
        [agendaList add:[MEAgendaController agendaGenerator]];
    }
    return self;
}

- (void)loadView {
    MEAgendaView *agendaView = [[MEAgendaView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    agendaView.delegate = self;
    
    self.view = agendaView;
    [agendaView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)agenda:(MEAgendaView *)agendaView scheduleNumInAgenda:(NSInteger)index {
    if (![self isValidIndexOfAgendaList:index]) {
        return 0;
    }
    return [agendaList agendaAtIndex:index].scheduleCount;
}

- (void)agenda:(MEAgendaView *)agendaView cell:(MEScheduleCell *)cell atScheduleIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex {
    if (![self isValidIndexOfAgendaList:agendaIndex]) {
        return;
    }
    
    MEAgenda *agenda = [agendaList agendaAtIndex:agendaIndex];
    MESchedule *schedule = [agenda scheduleAt:scheduleIndex];
    
    cell.title = schedule.title;
    cell.comment = schedule.comment;
    cell.from = schedule.from;
    cell.to = schedule.to;
}

- (MEDate)agenda:(MEAgendaView *)agendaView dateAtIndex:(NSInteger)index {
    if (![self isValidIndexOfAgendaList:index]) {
        return MEDATE_INVALID;
    }
    return [agendaList agendaAtIndex:index].date;
}

- (void)dealloc {
    [agendaList release];
    
    [super dealloc];
}

- (BOOL)isValidIndexOfAgendaList:(NSInteger)index {
    return index >= 0 && index < agendaList.count;
}

+ (MEAgenda *)agendaGenerator {
    MEAgenda *agenda = [[[MEAgenda alloc] initOnYear:2012 month:9 day:15] autorelease];
    
    MESchedule *schedule1 = [MESchedule schedule:@"Heading to Airport" from:12 to:13.30];
    schedule1.comment = @"Beijing, Xi'an, Shanghai group take bus to local airport";
    [agenda addSchedule:schedule1];
    [schedule1 release];
    
    MESchedule *schedule2 = [MESchedule schedule:@"Fly to Chengdu" from:13.30 to:16];
    schedule2.comment = @"Check in and fly to Chengdu, time may will be adjusted";
    [agenda addSchedule:schedule2];
    [schedule2 release];
    
    return agenda;
}

@end
