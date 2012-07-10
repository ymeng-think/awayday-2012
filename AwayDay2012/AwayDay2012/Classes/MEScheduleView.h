//
//  MEScheduleView.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MENibView.h"
#import "MEDate.h"

@interface MEScheduleView : MENibView {
    NSString *title;
    MEDate scheduledOn;
    CGFloat from;
    CGFloat to;
    NSString *description;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *fromLabel;
@property (nonatomic, retain) IBOutlet UILabel *toLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, retain) NSString *title;
@property (nonatomic) MEDate scheduledOn;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;
@property (nonatomic, retain) NSString *description;

@end
