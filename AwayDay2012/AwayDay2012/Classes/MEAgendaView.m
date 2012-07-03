//
//  MEAgendaView.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaView.h"
#import "MEScheduleCell.h"

@interface MEAgendaView ()

- (void)addPlanView;

@end

@implementation MEAgendaView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addPlanView];
    }
    return self;
}

- (void)addPlanView {
    plan = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    plan.dataSource = self;
    
    [self addSubview:plan];
}

- (void)layoutSubviews {
    plan.frame = self.frame;
}

- (void)dealloc {
    [plan release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!delegate) {
        return 0;
    }
    return [delegate agenda:self scheduleNumInAgenda:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"AgendaCellIdentifier";
    
    MEScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [MEScheduleCell cellForTable:tableView withOwner:nil];
    }
    
    if (delegate) {
        [delegate agenda:self cell:cell atScheduleIndex:[indexPath row] inAgenda:[indexPath section]];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!delegate) {
        return nil;
    }
    
    MEDate date = [delegate agenda:self dateAtIndex:section];
    if (!MEDateIsValid(date)) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%i / %i / %i", date.year, date.month, date.day];
}

@end
