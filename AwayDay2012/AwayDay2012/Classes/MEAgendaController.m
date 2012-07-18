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
#import "MEColor.h"
#import "MESessionList.h"
#import "MESchedule.h"
#import "MEScheduleCell.h"
#import "MEScheduleExposingController.h"

#define WINDOW_NAME            @"Awayday 2012"
#define FAVORITE_BUTTON_TITLE  @"Favorite"
#define DONE_BUTTON_TITLE      @"Done"

@interface MEAgendaController ()

- (BOOL)isValidIndexOfAgendaList:(NSInteger)index;
- (void)exposeSchedule:(MESchedule *)schedule;
- (void)loadAgendaListFromFile:(NSString *)fileName;
- (void)addSessionToFavorite;
- (void)confirmFavoriteSession;
- (UIBarButtonItem *)favoriteButton;
- (UIBarButtonItem *)doneButton;
- (void)setAgendaList:(MEAgendaList *)_agendaList;

@end

@implementation MEAgendaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadAgendaListFromFile:@"agenda"];
        self->favoriteSessionList = [[MESessionList alloc] init];

        self.navigationItem.rightBarButtonItem = [self favoriteButton];
        self.title = WINDOW_NAME;
    }
    return self;
}

- (void)loadView {
    agendaView = [[MEAgendaView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    agendaView.delegate = self;
    
    self.view = agendaView;
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
    allAgendaList = [[agendaLoader loadFromFile:fileName] retain];
    agendaList = [allAgendaList retain];
    [agendaLoader release];
}

- (UIBarButtonItem *)favoriteButton {
    if (!favoriteButton) {
        favoriteButton = [[UIBarButtonItem alloc] initWithTitle:FAVORITE_BUTTON_TITLE
                                                          style:UIBarButtonItemStylePlain
                                                         target:self 
                                                         action:@selector(addSessionToFavorite)];
    }
    return favoriteButton;
}

- (UIBarButtonItem *)doneButton {
    if (!doneButton) {
        doneButton = [[UIBarButtonItem alloc] initWithTitle:DONE_BUTTON_TITLE
                                                      style:UIBarButtonItemStylePlain
                                                     target:self 
                                                     action:@selector(confirmFavoriteSession)];
        doneButton.tintColor = UIColorFromRGB(0xC84131);
    }
    return doneButton;
}

- (void)setAgendaList:(MEAgendaList *)_agendaList {
    if (self->agendaList == _agendaList) {
        return;
    }
    
    [self->agendaList release];
    self->agendaList = [_agendaList retain];
}

- (void)dealloc {
    [allAgendaList release];
    [agendaList release];
    [agendaView release];
    [favoriteButton release];
    [doneButton release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Delegation for Agenda View

- (NSInteger)numberOfAgenda:(MEAgendaView *)agendaView {
    return agendaList.count;
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
    [cell setSelected:[favoriteSessionList containsSession:schedule.title on:schedule.scheduledOn] animated:NO];
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

- (void)agenda:(MEAgendaView *)agendaView didSelectScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex {
    MEAgenda *agenda = [agendaList agendaAtIndex:agendaIndex];
    MESchedule *schedule = [agenda scheduleAt:scheduleIndex];

    [self->favoriteSessionList addSession:schedule];
}

- (void)agenda:(MEAgendaView *)agendaView didDeselectScheduleAtIndex:(NSInteger)scheduleIndex inAgenda:(NSInteger)agendaIndex {
    MEAgenda *agenda = [agendaList agendaAtIndex:agendaIndex];
    MESchedule *schedule = [agenda scheduleAt:scheduleIndex];
    
    [self->favoriteSessionList removeSession:schedule];
}

#pragma mark -
#pragma mark Delegation for Following Schedule Button

- (void)addSessionToFavorite {
    self.navigationItem.rightBarButtonItem = [self doneButton];

    [self setAgendaList:[allAgendaList onlySessionList]];
    [agendaView startToSelectFavoriteSession];
}

- (void)confirmFavoriteSession {
    self.navigationItem.rightBarButtonItem = [self favoriteButton];
    
    [self setAgendaList:allAgendaList];
    [agendaView confirmFavoriteSession];
}

@end
