//
//  MESchedule.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEDate.h"

@interface MESchedule : NSObject {
    NSString *title;
    NSString *comment;
    
    CGFloat from;
    CGFloat to;
    MEDate scheduledOn;
    BOOL isSession;
}

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic, readonly) CGFloat from;
@property (nonatomic, readonly) CGFloat to;
@property (nonatomic) MEDate scheduledOn;
@property (nonatomic) BOOL isSession;

+ (id)schedule:(NSString *)title from:(CGFloat)from to:(CGFloat)to;

@end
