//
//  MEAgendaSectionHeader.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEDate.h"

@interface MEAgendaSectionHeader : UIView

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *dayLabel;
@property (nonatomic, retain) IBOutlet UILabel *yearAndMonthLabel;

- (void)setDate:(MEDate)date;

@end
