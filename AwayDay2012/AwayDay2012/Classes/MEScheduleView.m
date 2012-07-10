//
//  MEScheduleView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleView.h"
#import "METimeFormat.h"

@implementation MEScheduleView

@synthesize titleLabel, dateLabel, fromLabel, toLabel, descriptionLabel;
@synthesize title, scheduledOn, from, to, description;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setTitle:(NSString *)_title {
    if (self->title == _title) {
        return;
    }
    
    [self->title release];
    self->title = [_title retain];
    
    titleLabel.text = self->title;
}

- (void)setFrom:(CGFloat)_from {
    self->from = _from;
    
    fromLabel.text = FloatToTimeString(self->from);
}

- (void)setTo:(CGFloat)_to {
    self->to = _to;
    
    toLabel.text = FloatToTimeString(self->to);
}

- (void)setScheduledOn:(MEDate)_scheduledOn {
    self->scheduledOn = MEDateCopy(_scheduledOn);
    
    dateLabel.text = NSStringFromMEDate(self->scheduledOn);
}


+ (NSString *)nibName {
    return @"schedule-detail";
}

@end
