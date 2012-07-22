//
//  MELecturerListLoader.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "METextFileLoader.h"

@interface MELecturerListLoader : NSObject <METextFileParser> {
    NSMutableArray *nameList;
}

- (NSArray *)loadFromFile:(NSString *)fileName;

@end
