//
//  MESessionList.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/16/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEDate.h"

@class MESchedule;

@interface MEFavoriteSessionList : NSObject {
    NSMutableDictionary *dict;
}

- (void)addSession:(NSString *)name on:(MEDate)date;
- (void)removeSession:(NSString *)name on:(MEDate)date;
- (BOOL)containsSession:(NSString *)name on:(MEDate)date;

- (id)initWithContentsOfFile:(NSString *)filePath;
- (void)writeToFile:(NSString *)filePath;

@end
