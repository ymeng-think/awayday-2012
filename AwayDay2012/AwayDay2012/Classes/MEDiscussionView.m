//
//  MEDiscussionView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDiscussionView.h"
#import "MELecturerCell.h"

#define RESOURCE_NAME @"discussion"

@interface MEDiscussionView ()

- (void)addHeadPortraitListForLecturer;

@end

@implementation MEDiscussionView

@synthesize view;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
        [self addSubview:self.view];

        [self addHeadPortraitListForLecturer];
    }
    return self;
}

- (void)addHeadPortraitListForLecturer {
    headPortraitList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    headPortraitList.backgroundColor = [UIColor clearColor];
    headPortraitList.separatorStyle = UITableViewCellSeparatorStyleNone;
    headPortraitList.rowHeight = 92.0;
    headPortraitList.dataSource = self;

    
    [self addSubview:headPortraitList];
}

- (void)layoutSubviews {
    headPortraitList.frame = self.frame;
}

- (void)dealloc {
    [self.view release];
    [self->headPortraitList release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"HeadPortraitCellIdentifier";
    
    MELecturerCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[MELecturerCell alloc] initWithReuseIdentifier:kCellIdentifier];
    }
    
    return cell;
}

@end
