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
#import "MEAgendaLoader.h"
#import "MESchedule.h"
#import "MEScheduleCell.h"

@interface MEAgendaController ()

- (BOOL)isValidIndexOfAgendaList:(NSInteger)index;

@end

@implementation MEAgendaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        MEAgendaLoader *agendaLoader = [[MEAgendaLoader alloc] init];
        agendaList = [[agendaLoader loadFromFile:@"agenda"] retain];
        [agendaLoader release];
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

- (void)dealloc {
    [agendaList release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Delegation for Agenda View

- (NSInteger)numberOfAgenda:(MEAgendaView *)agendaView {
    return [agendaList count];
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

- (BOOL)isValidIndexOfAgendaList:(NSInteger)index {
    return index >= 0 && index < agendaList.count;
}

@end
