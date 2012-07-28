//
//  MEFontLibrary.m
//  OneHour4Me
//
//  Created by Meng Yu on 7/26/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEFont.h"

static MEFont *gSharedInstance;

@implementation MEFont

+ (MEFont *)sharedLibrary {
    if (!gSharedInstance) {
        gSharedInstance = [[MEFont alloc] init];
    }
    
    return gSharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        fontLib = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (UIFont *)fontWithName:(NSString *)name size:(CGFloat)size {
    NSString *key = [[NSString alloc] initWithFormat:@"%@, %g", name, size];
    
    UIFont *font = [fontLib objectForKey:key];
    if (!font) {
        font = [UIFont fontWithName:name size:size];
        [fontLib setObject:font forKey:key];
    }
    
    [key release];
    return font;
}

- (void)dealloc {
    [fontLib release];
    
    [super dealloc];
}

@end
