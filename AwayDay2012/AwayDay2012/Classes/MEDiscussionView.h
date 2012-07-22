//
//  MEDiscussionView.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEDiscussionView : UIView <UITableViewDataSource> {
    UITableView *headPortraitList;
}

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) NSArray *lecturerList;

@end
