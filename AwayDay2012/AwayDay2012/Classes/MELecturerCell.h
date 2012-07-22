//
//  MEHeadPortraitCell.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEAD_PORTRAIT_NUM   4

@interface MELecturerCell : UITableViewCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)setLecturers:(NSArray *)nameList;

@end
