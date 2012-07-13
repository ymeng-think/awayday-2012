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
    plan.delegate = self;
    plan.allowsMultipleSelectionDuringEditing = YES;
    
    [self addSubview:plan];
}

- (void)layoutSubviews {
    plan.frame = self.frame;
}

- (void)startToSelectFavoriteSession {
    [plan setEditing:YES animated:YES];
}

- (void)confirmFavoriteSession {
    [plan setEditing:NO animated:YES];
}

- (void)dealloc {
    [plan release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!delegate) {
        return 1;
    }
    return [delegate numberOfAgenda:self];
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
    
    return NSStringFromMEDate(date);
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (!delegate || 
        ![delegate respondsToSelector:@selector(agenda:exposeScheduleAtIndex:inAgenda:)]) {
        return;
    }    
    
    [delegate agenda:self exposeScheduleAtIndex:[indexPath row] inAgenda:[indexPath section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!tableView.isEditing) {
        return;
    }
    
    NSLog(@"select row %i in section %i", [indexPath row], [indexPath section]);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!tableView.isEditing) {
        return;
    }
    
    NSLog(@"DEselect row %i in section %i", [indexPath row], [indexPath section]);
}

@end
