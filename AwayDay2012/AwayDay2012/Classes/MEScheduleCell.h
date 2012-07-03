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
    NSString *comment;
    CGFloat from;
    CGFloat to;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *commentLabel;
@property (nonatomic, retain) IBOutlet UILabel *fromLabel;
@property (nonatomic, retain) IBOutlet UILabel *toLabel;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;

@end
