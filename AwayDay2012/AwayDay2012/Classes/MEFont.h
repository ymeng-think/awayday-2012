//
//  MEFontLibrary.h
//  OneHour4Me
//
//  Created by Meng Yu on 7/26/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MEFONT_CENTURY_GOTHIC @"Century Gothic"

@interface MEFont : NSObject {
    NSMutableDictionary *fontLib;
}

+ (MEFont *)sharedLibrary;
- (UIFont *)fontWithName:(NSString *)name size:(CGFloat)size;

@end
