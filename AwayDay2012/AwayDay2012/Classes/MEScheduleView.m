//
//  MEScheduleView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleView.h"
#import "METimeFormat.h"

@interface MEScheduleView ()

+ (void)fixHeightForContent:(UILabel *)label;

@end

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

- (void)layoutSubviews {
    [[self class] fixHeightForContent:descriptionLabel];
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

- (void)setDescription:(NSString *)_description {
    if (self->description == _description) {
        return;
    }
    
    [self->description release];
    self->description = [_description retain];
    
    descriptionLabel.text = self->description;
}

- (void)dealloc {
    [titleLabel release];
    [dateLabel release];
    [fromLabel release];
    [toLabel release];
    [descriptionLabel release];
    
    [self->title release];
    [self->description release];
    
    [super dealloc];
}

+ (NSString *)nibName {
    return @"schedule-detail";
}

+ (void)fixHeightForContent:(UILabel *)label {
    static const int MAX_HEIGHT = 9999;
    
    CGSize maximumLabelSize = CGSizeMake(label.bounds.size.width, MAX_HEIGHT);
    CGSize expectedLabelSize = [label.text sizeWithFont:label.font 
                                      constrainedToSize:maximumLabelSize 
                                          lineBreakMode:label.lineBreakMode]; 
    
    CGRect newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    label.frame = newFrame;
}

@end
