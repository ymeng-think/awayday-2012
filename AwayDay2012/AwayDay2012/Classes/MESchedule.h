//
//  MESchedule.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MESchedule : NSObject {
    NSString *title;
    NSString *comment;
    
    CGFloat from;
    CGFloat to;
}

@property (nonatomic, retain, readonly) NSString *title;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;

+ (id)schedule:(NSString *)title from:(CGFloat)from to:(CGFloat)to;

@end
