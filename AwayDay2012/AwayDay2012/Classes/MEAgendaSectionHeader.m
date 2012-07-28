//
//  MEAgendaSectionHeader.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAgendaSectionHeader.h"
#import "MEColor.h"
#import "MEFont.h"
#import "UILabelExtension.h"

#define RESOURCE_NAME   @"agenda-section-header"
#define WATER_COLOR     UIColorFromRGB(0x21CDDB)

@interface MEAgendaSectionHeader ()

+ monthStr:(NSInteger)month;

@end

@implementation MEAgendaSectionHeader
@synthesize view, dayLabel, yearAndMonthLabel;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

- (void)setDate:(MEDate)date {
    dayLabel.text = [NSString stringWithFormat:@"%i", date.day];
    yearAndMonthLabel.text = [NSString stringWithFormat:@"%@, %i", [self.class monthStr:date.month], date.year];
}

- (void)layoutSubviews {
    [dayLabel withColor:WATER_COLOR font:MEFONT_CENTURY_GOTHIC size:18];
    [yearAndMonthLabel withColor:WATER_COLOR font:MEFONT_CENTURY_GOTHIC size:13];
    
    [super layoutSubviews];
}

+ monthStr:(NSInteger)month {
    NSArray *months = [NSArray arrayWithObjects:@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
    
    NSString *strMonth = [months objectAtIndex:(month - 1)];
    return strMonth;
}

@end
