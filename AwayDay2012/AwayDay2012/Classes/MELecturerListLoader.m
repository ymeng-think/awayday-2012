//
//  MELecturerListLoader.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MELecturerListLoader.h"

@implementation MELecturerListLoader

- (id)init {
    self = [super init];
    if (self) {
        self->nameList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)loadFromFile:(NSString *)fileName {
    METextFileLoader *fileLoader = [[METextFileLoader alloc] init];
    [fileLoader loadFromFile:fileName withParser:self];
    [fileLoader release];
    
    return [NSArray arrayWithArray:nameList];
}

- (void)parseLine:(NSString *)line {
    [nameList addObject:line];
}

- (void)dealloc {
    [self->nameList release];
    
    [super dealloc];
}

@end
