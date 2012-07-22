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
- (NSArray *)subLecturerListFrom:(NSInteger)from to:(NSInteger)to;

@end

@implementation MEDiscussionView

@synthesize view, lecturerList;

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
    [view release];
    [self->headPortraitList release];
    [lecturerList release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!lecturerList) {
        return 0;
    }
    return (lecturerList.count + (HEAD_PORTRAIT_NUM - 1)) / HEAD_PORTRAIT_NUM;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"HeadPortraitCellIdentifier";
    
    MELecturerCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[[MELecturerCell alloc] initWithReuseIdentifier:kCellIdentifier] autorelease];
    }
    NSInteger from = [indexPath row] * HEAD_PORTRAIT_NUM;
    NSInteger to = from + HEAD_PORTRAIT_NUM > lecturerList.count ? lecturerList.count : from + HEAD_PORTRAIT_NUM;
    [cell setLecturers:[self subLecturerListFrom:from to:to]];
    
    return cell;
}

- (NSArray *)subLecturerListFrom:(NSInteger)from to:(NSInteger)to {
    NSInteger capacity = to - from;
    NSMutableArray *subList = [[[NSMutableArray alloc] initWithCapacity:capacity] autorelease];
    for (NSInteger i = from; i < to; i++) {
        NSString *lecturerName = [lecturerList objectAtIndex:i];
        [subList addObject:lecturerName];
    }
    
    return subList;
}

@end
