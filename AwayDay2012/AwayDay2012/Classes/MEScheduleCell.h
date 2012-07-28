//
//  MEScheduleCell.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/29/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHNibTableViewCell.h"

@interface MEScheduleCell : MHNibTableViewCell {
    NSString *title;
    CGFloat from;
    CGFloat to;
    NSString *lecturer;
    
    UITableViewCellAccessoryType originalAccessoryType;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *lecturerLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeIntervalLabel;
@property (nonatomic, retain) IBOutlet UIImageView *indicator;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *lecturer;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;

@end
