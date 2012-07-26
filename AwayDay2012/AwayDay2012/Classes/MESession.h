//
//  MESession.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/26/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESchedule.h"

@interface MESession : MESchedule {
    NSString *lecturer;
}

@property (nonatomic, readonly) NSString *lecturer;

- initWithTitle:(NSString *)title lecturer:(NSString *)lecturer from:(CGFloat)from to:(CGFloat)to;

@end
