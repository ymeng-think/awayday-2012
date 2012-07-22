//
//  MEDiscussionView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDiscussionView.h"

#define RESOURCE_NAME @"discussion"

@implementation MEDiscussionView

@synthesize view;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

- (void)dealloc {
    [self.view release];
    
    [super dealloc];
}

@end
