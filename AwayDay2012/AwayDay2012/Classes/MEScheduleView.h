//
//  MEScheduleView.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEDate.h"

@interface MEScheduleView : UIView {

}

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *datetimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;

- (void)setTitle:(NSString *)title;
- (void)setDescription:(NSString *)description;
- (void)setDate:(MEDate)date from:(CGFloat)from to:(CGFloat)to;


@end
