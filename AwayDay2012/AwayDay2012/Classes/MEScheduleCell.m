//
//  MEScheduleCell.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/29/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleCell.h"
#import "METimeFormat.h"

#define X_OF_EDITING_HORIZONTAL   40
#define X_OF_INIT_HORIZONTAL      10
#define IMAGE_SELECTED            @"selected.png"
#define IMAGE_NOT_SELECTED        @"not-selected.png"

@interface MEScheduleCell ()

- (void)exchangeIndicatorShown:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    indicator.image = selected ? [UIImage imageNamed:IMAGE_SELECTED] : [UIImage imageNamed:IMAGE_NOT_SELECTED];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    BOOL isEditing = ((UITableView *)self.superview).isEditing;
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(exchangeIndicatorShown:finished:context:)];
    
	[super layoutSubviews];
    
    CGRect contentFrame = self.contentView.frame;
    
	if (isEditing) {
		contentFrame.origin.x = X_OF_EDITING_HORIZONTAL;
		self.contentView.frame = contentFrame;
        self.accessoryType = UITableViewCellAccessoryNone;
        
	} else {
		contentFrame.origin.x = X_OF_INIT_HORIZONTAL;
		self.contentView.frame = contentFrame;
        indicator.hidden = YES;
	}
    
	[UIView commitAnimations];
}

- (void)exchangeIndicatorShown:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if (![finished boolValue]) {
        return;
    }
    
    BOOL isEditing = ((UITableView *)self.superview).isEditing;
    if (isEditing) {
        indicator.hidden = NO;
    } else {
        self.accessoryType = self->originalAccessoryType;
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
