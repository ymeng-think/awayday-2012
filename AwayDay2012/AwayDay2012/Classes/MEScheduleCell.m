//
//  MEScheduleCell.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/29/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleCell.h"

@interface MEScheduleCell ()

+ (NSString *)convertToTimeFormat:(CGFloat)f;

@end

@implementation MEScheduleCell

@synthesize titleLabel, commentLabel, fromLabel, toLabel;
@synthesize title, comment, from, to;

+ (NSString *)nibName {
    return @"schedule-cell";
}

- (void)setTitle:(NSString *)_title {
    if (self->title == _title) {
        return;
    }
    
    [self->title release];
    self->title = [_title retain];
    
    titleLabel.text = self->title;
}

- (void)setComment:(NSString *)_comment {
    if (self->comment == _comment) {
        return;
    }
    
    [self->comment release];
    self->comment = [_comment retain];
    
    commentLabel.text = self->comment;
}

- (void)setFrom:(CGFloat)_from {
    self->from = _from;
    
    fromLabel.text = [MEScheduleCell convertToTimeFormat:self->from];
}

- (void)setTo:(CGFloat)_to {
    self->to = _to;
    
    toLabel.text = [MEScheduleCell convertToTimeFormat:self->to];
}

- (void)dealloc {
    [titleLabel release];
    [commentLabel release];
    [fromLabel release];
    [toLabel release];
    
    [self->title release];
    [self->comment release];
        
    [super dealloc];
}

+ (NSString *)convertToTimeFormat:(CGFloat)f {
    return [[NSString stringWithFormat:@"%.2f", f] stringByReplacingOccurrencesOfString:@"." withString:@":"];
}

@end
