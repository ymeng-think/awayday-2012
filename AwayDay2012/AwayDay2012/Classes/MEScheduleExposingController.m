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
    UIView *view = [MEScheduleView loadFromNib];
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
    scheduleView.scheduledOn = self->schedule.scheduledOn;
    scheduleView.from = self->schedule.from;
    scheduleView.to = self->schedule.to;
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
