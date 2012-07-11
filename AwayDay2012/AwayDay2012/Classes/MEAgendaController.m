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
#import "MEScheduleExposingController.h"

#define WINDOW_NAME             @"Awayday 2012"
#define FOLLOWING_BUTTON_TITLE  @"Follow"

@interface MEAgendaController ()

- (BOOL)isValidIndexOfAgendaList:(NSInteger)index;
- (void)exposeSchedule:(MESchedule *)schedule;
- (void)loadAgendaListFromFile:(NSString *)fileName;
- (void)addScheduleFollowing;
- (void)willFollow;

@end

@implementation MEAgendaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadAgendaListFromFile:@"agenda"];
        [self addScheduleFollowing];
        
        self.title = WINDOW_NAME;
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

- (void)loadAgendaListFromFile:(NSString *)fileName {
    MEAgendaLoader *agendaLoader = [[MEAgendaLoader alloc] init];
    agendaList = [[agendaLoader loadFromFile:fileName] retain];
    [agendaLoader release];
}

- (void)addScheduleFollowing {
    UIBarButtonItem *followingButton = [[UIBarButtonItem alloc] initWithTitle:FOLLOWING_BUTTON_TITLE
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self 
                                                                       action:@selector(willFollow)];
    self.navigationItem.rightBarButtonItem = followingButton;
    [followingButton release];
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

- (void)agenda:(MEAgendaView *)agendaView exposeScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex {
    if (![self isValidIndexOfAgendaList:agendaIndex]) {
        return;
    }
    
    MEAgenda *agenda = [agendaList agendaAtIndex:agendaIndex];
    MESchedule *schedule = [agenda scheduleAt:scheduleIndex];
    
    [self exposeSchedule:schedule];
}

- (void)exposeSchedule:(MESchedule *)schedule {
    MEScheduleExposingController *controller = [[MEScheduleExposingController alloc] init];
    [controller exposeSchedule:schedule];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

#pragma mark -
#pragma mark Delegation for Following Schedule Button

- (void)willFollow {
    NSLog(@"will follow schedule");
}

@end
