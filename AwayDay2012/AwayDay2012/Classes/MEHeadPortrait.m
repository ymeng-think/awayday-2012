//
//  MEHeadPortrait.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEHeadPortrait.h"

#define RESOURCE_NAME @"head-portrait"

@interface MEHeadPortrait()

+ (NSString *)capitalizeName:(NSString *)theName;

@end

@implementation MEHeadPortrait
@synthesize view, name, portrait;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:RESOURCE_NAME owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

- (void)setLecture:(NSString *)lectureName {
    NSString *imageName = [NSString stringWithFormat:@"%@.png", lectureName];
    self.portrait.image = [UIImage imageNamed:imageName];
    self.name.text = [[self class] capitalizeName:lectureName];
}

- (void)dealloc {
    [self.name release];
    [self.portrait release];
    [self.view release];
    
    [super dealloc];
}

+ (NSString *)capitalizeName:(NSString *)theName {
    static NSString *kNameSeparator = @".";
    
    NSArray *parts = [theName componentsSeparatedByString:kNameSeparator];
    NSMutableString *capitalized = [NSMutableString stringWithCapacity:theName.length];
    for (NSInteger i = 0; i < parts.count; i++) {
        NSString *input = [parts objectAtIndex:i];
        NSString *firstChar = [input substringToIndex:1];
        [capitalized appendString:[firstChar uppercaseString]];
        [capitalized appendString:[input substringFromIndex:1]];
        
        if (i < parts.count - 1) {
            [capitalized appendString:kNameSeparator];
        }
    }
    
    return [NSString stringWithString:capitalized];
}

@end
