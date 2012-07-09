//
//  MEScheduleDetailController.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MESchedule;

@interface MEScheduleExposingController : UIViewController {
    MESchedule *schedule;
}

- (void)exposeSchedule:(MESchedule *)schedule;

@end
