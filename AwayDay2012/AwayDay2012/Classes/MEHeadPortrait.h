//
//  MEHeadPortrait.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEHeadPortrait : UIView

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UIImageView *portrait;

- (void)setLecture:(NSString *)lecturerName;

@end
