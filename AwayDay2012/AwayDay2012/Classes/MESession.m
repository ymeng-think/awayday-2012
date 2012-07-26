//
//  MESession.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/26/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESession.h"

@implementation MESession
@synthesize lecturer;

- initWithTitle:(NSString *)_title lecturer:(NSString *)_lecturer from:(CGFloat)_from to:(CGFloat)_to {
    self = [super initWithTitle:_title from:_from to:_to];
    if (self) {
        self->lecturer = [_lecturer retain];
    }
    return self;
}

- (void)dealloc {
    [self->lecturer release];
    
    [super dealloc];
}

@end
