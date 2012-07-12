//
//  MEScheduleCell.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/29/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleCell.h"
#import "METimeFormat.h"

#define EDITING_HORIZONTAL_OFFSET 35
#define X_OF_CONTENT_VIEW         10

@interface MEScheduleCell ()

@end

@implementation MEScheduleCell

@synthesize titleLabel, commentLabel, fromLabel, toLabel, indicator;
@synthesize title, comment, from, to;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self->originalAccessoryType = self.accessoryType;
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
    
    fromLabel.text = FloatToTimeString(self->from);
}

- (void)setTo:(CGFloat)_to {
    self->to = _to;
    
    toLabel.text = FloatToTimeString(self->to);
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    const CGFloat OFFSET_ANIMATION_DURATION = 0.18;
    BOOL isEditing = ((UITableView *)self.superview).isEditing;
    
    if (isEditing) {
        [super layoutSubviews];
        self.accessoryType = UITableViewCellAccessoryNone;
        [UIView animateWithDuration:OFFSET_ANIMATION_DURATION
                         animations:^{ 
                             CGRect contentFrame = self.contentView.frame;
                             contentFrame.origin.x += EDITING_HORIZONTAL_OFFSET;
                             self.contentView.frame = contentFrame;
                         } 
                         completion:^ (BOOL finished){ 
                             if (finished) { 
                                 indicator.hidden = NO;
                             }
                         }
         ];
    } else {
        indicator.hidden = YES;
        [UIView animateWithDuration:OFFSET_ANIMATION_DURATION
                         animations:^{
                             [super layoutSubviews];
                             
                             CGRect contentFrame = self.contentView.frame;
                             contentFrame.origin.x = X_OF_CONTENT_VIEW;
                             self.contentView.frame = contentFrame;
                         } 
                         completion:^ (BOOL finished){ 
                             if (finished) { 
                                 self.accessoryType = self->originalAccessoryType;
                             }
                         }
         ];
    }
}

- (void)dealloc {
    [titleLabel release];
    [commentLabel release];
    [fromLabel release];
    [toLabel release];
    [indicator release];
    
    [self->title release];
    [self->comment release];
        
    [super dealloc];
}

+ (NSString *)nibName {
    return @"schedule-cell";
}

@end
