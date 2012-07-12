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
#define SELECTION_INDICATOR_TAG   1

@interface MEScheduleCell ()

- (void)exchangeAccessoryType:(BOOL)isEditing;
- (void)offsetContentView:(BOOL)isEditing;
- (void)exchangeIndicatorShown:(BOOL)isEditing;

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
    
    [self exchangeAccessoryType:isEditing];
    
	[super layoutSubviews];
    [UIView animateWithDuration:OFFSET_ANIMATION_DURATION
                     animations:^{ 
                         [self offsetContentView:isEditing]; 
                     } 
                     completion:^ (BOOL finished){ 
                         if (finished) { 
                             [self exchangeIndicatorShown:isEditing]; 
                         }
                     }
     ];
}

- (void)exchangeAccessoryType:(BOOL)isEditing {
    if (isEditing) {
        originalAccessoryType = self.accessoryType;
        self.accessoryType = UITableViewCellAccessoryNone;
    } else {
        self.accessoryType = originalAccessoryType;
    }
}

- (void)offsetContentView:(BOOL)isEditing {
    if (isEditing) {
		CGRect contentFrame = self.contentView.frame;
		contentFrame.origin.x += EDITING_HORIZONTAL_OFFSET;
		self.contentView.frame = contentFrame;
	} else {
		CGRect contentFrame = self.contentView.frame;
		contentFrame.origin.x = X_OF_CONTENT_VIEW;
		self.contentView.frame = contentFrame;
	}
}

- (void)exchangeIndicatorShown:(BOOL)isEditing {
    if (isEditing) {
        indicator.hidden = NO;
    } else {
        indicator.hidden = YES;
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
