//
//  MEScheduleDetailController.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleExposingController.h"
#import "MESchedule.h"
#import "MEScheduleView.h"

@interface MEScheduleExposingController ()

@end

@implementation MEScheduleExposingController

- (void)loadView {
    UIView *view = [[MEScheduleView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    [view release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    if (!self->schedule) {
        return;
    }
    
    MEScheduleView *scheduleView = (MEScheduleView *)self.view;
    scheduleView.title = self->schedule.title;
    [scheduleView setDate:self->schedule.scheduledOn from:self->schedule.from to:self->schedule.to];
    scheduleView.description = self->schedule.comment;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)exposeSchedule:(MESchedule *)_schedule {
    self->schedule = [_schedule retain];
}

- (void)dealloc {
    [self->schedule release];
    
    [super dealloc];
}

@end
