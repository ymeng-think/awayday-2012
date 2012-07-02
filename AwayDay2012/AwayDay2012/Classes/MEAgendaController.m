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

- (NSInteger)agenda:(MEAgendaView *)agendaView scheduleNumInDay:(MEDate)date {
    MEAgenda *agenda = [agendaList findByDate:date];
    if (agenda) {
        return [agenda scheduleCount];
    }
    return 0;
}

- (void)agenda:(MEAgendaView *)agendaView cell:(MEScheduleCell *)cell atIndex:(NSInteger)index inDay:(MEDate)date {
    MEAgenda *agenda = [agendaList findByDate:date];
    if (!agenda) {
        return;
    }
    
    MESchedule *schedule = [agenda scheduleAt:index];
    cell.titleLabel.text = schedule.title;
    cell.commentLabel.text = schedule.comment;
    cell.fromLabel.text = [NSString stringWithFormat:@"%.2f", schedule.from];
    cell.toLabel.text = [NSString stringWithFormat:@"%.2f", schedule.to];
}

- (void)dealloc {
    [agendaList release];
    
    [super dealloc];
}

+ (MEAgenda *)agendaGenerator {
    MEAgenda *agenda = [[[MEAgenda alloc] initOnYear:2012 month:9 day:15] autorelease];
    
    MESchedule *schedule1 = [MESchedule schedule:@"Heading to Airport" from:12 to:13.30];
    schedule1.comment = @"Beijing, Xi'an, Shanghai group take bus to local airport";
    [agenda addSchedule:schedule1];
    [schedule1 release];
    
    return agenda;
}

@end
