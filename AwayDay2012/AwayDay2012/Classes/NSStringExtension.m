//
//  NSStringExtension.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/27/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "NSStringExtension.h"

#define EMPTY_STRING @""

@implementation NSString (NSStringExtension)

+ (BOOL)isEmptyOrNull:(NSString *)s {
    return s == Nil || s == EMPTY_STRING;
}

@end
