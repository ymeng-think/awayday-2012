//
//  MEScheduleView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEScheduleView.h"
#import "METimeFormat.h"

#define RESOURCE_NAME @"schedule-detail"

@interface MEScheduleView ()

+ (void)fixHeightForContent:(UILabel *)label;

@end

@implementation MEScheduleView
@synthesize view, titleLabel, datetimeLabel, descriptionLabel;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
    [self addSubview:self.view];
}

- (void)layoutSubviews {
    [[self class] fixHeightForContent:descriptionLabel];
}

- (void)setTitle:(NSString *)_title {
    titleLabel.text = _title;
}

- (void)setDate:(MEDate)_date from:(CGFloat)_from to:(CGFloat)_to {
    NSString *dateStr = [NSString stringWithFormat:@"%i %@, %i", _date.day, MonthToAbbreviationString(_date.month), _date.year];
    NSString *timeStr = TimeIntervalString(_from, _to);
    
    datetimeLabel.text = [NSString stringWithFormat:@"%@  %@", dateStr, timeStr];
}

- (void)setDescription:(NSString *)_description {
    descriptionLabel.text = _description;
}

- (void)dealloc {
    [view release];
    [titleLabel release];
    [datetimeLabel release];
    [descriptionLabel release];
    
    [super dealloc];
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
