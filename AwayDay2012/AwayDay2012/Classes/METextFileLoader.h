//
//  METextFileLoader.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol METextFileParser

- (void)parseLine:(NSString *)line;

@end

@interface METextFileLoader : NSObject

- (void)loadFromFile:(NSString *)fileName withParser:(NSObject<METextFileParser> *)parser;

@end
