//
//  MEAgendaController.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaController.h"
#import "MEAgenda.h"
#import "MESchedule.h"

#define TAB_NAME @"AGENDA"

@interface MEAgendaController ()

+ (MEAgenda *)agendaGenerator;

@end

@implementation MEAgendaController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = TAB_NAME;
        
        agendaList = [NSArray arrayWithObjects:[MEAgendaController agendaGenerator], nil];
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

- (NSInteger)agenda:(MEAgendaView *)agenda scheduleNumInDay:(MEDate)date {
    MEAgenda *firstAgenda = (MEAgenda *)[agendaList objectAtIndex:0];
    return [firstAgenda scheduleCount];
}

- (void)agenda:(MEAgendaView *)agenda cell:(UITableViewCell *)cell atIndex:(NSInteger)index inDay:(MEDate)date {
    MEAgenda *firstAgenda = (MEAgenda *)[agendaList objectAtIndex:0];
    MESchedule *schedule = [firstAgenda scheduleAt:index];
    cell.textLabel.text = schedule.title;
}

+ (MEAgenda *)agendaGenerator {
    MEAgenda *agenda = [[[MEAgenda alloc] initOnYear:2012 month:9 day:15] autorelease];
    [agenda addSchedule:[MESchedule schedule:@"OO Bootcamp" from:10 to:11.30]];
    
    return agenda;
}

@end
