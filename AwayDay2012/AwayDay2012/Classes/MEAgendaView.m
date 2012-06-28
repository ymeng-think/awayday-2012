//
//  MEAgendaView.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaView.h"

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
    if (delegate) {
        return [delegate agenda:self scheduleNumInDay:MEDateMake(2012, 9, 15)];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"AgendaCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier] autorelease];
    }
    
    if (delegate) {
        [delegate agenda:self cell:cell atIndex:[indexPath row] inDay:MEDateMake(2012, 9, 15)];
    }
    
    return cell;
}

@end
