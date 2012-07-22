//
//  METextFileLoader.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "METextFileLoader.h"

#define COMMENT_PREFIX  '#'
#define FILE_EXTENSION  @"txt"
#define LINE_LIMITER    @"\n"

@interface METextFileLoader ()

- (NSString *)trimWhitespace:(NSString *)line;
- (BOOL)isBlank:(NSString *)line;
- (BOOL)isComment:(NSString *)line;

@end

@implementation METextFileLoader

- (void)loadFromFile:(NSString *)fileName withParser:(NSObject<METextFileParser> *)parser {
    NSParameterAssert(fileName != nil);
    NSParameterAssert(parser != nil);
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:FILE_EXTENSION];  
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath 
                                                            encoding:NSASCIIStringEncoding error:NULL];
    
    NSArray *lines = [fileContent componentsSeparatedByString:LINE_LIMITER];
    [fileContent release];
    
    NSEnumerator *nse = [lines objectEnumerator];
    NSString *line;
    while (line = [nse nextObject]) {
        line = [self trimWhitespace:line];
        
        if ([self isBlank:line] || [self isComment:line]) {
            continue;
        }
        
        [parser parseLine:line];
    }
}

- (NSString *)trimWhitespace:(NSString *)line {
    return [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isBlank:(NSString *)line {
    return line.length == 0;
}

- (BOOL)isComment:(NSString *)line {
    return [line characterAtIndex:0] == COMMENT_PREFIX;
}

@end
