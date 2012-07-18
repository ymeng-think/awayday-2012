//
//  MEDate.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/28/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    NSInteger year;
    NSInteger month;
    NSInteger day;
} MEDate;

CG_INLINE MEDate
MEDateMake(NSInteger year, NSInteger month, NSInteger day)
{
    MEDate date = { .year = year, .month = month, .day = day };
    return date;
}

CG_INLINE MEDate
MEDateCopy(MEDate date) {
    return MEDateMake(date.year, date.month, date.day);
}

#define MEDATE_INVALID MEDateMake(0, 0, 0)

CG_INLINE BOOL
MEDateIsValid(MEDate date) {
    return date.year > 0 && date.month > 0 && date.day > 0;
}

CG_INLINE NSString *
NSStringFromMEDate(MEDate date) {
    return [NSString stringWithFormat:@"%i / %i / %i", date.year, date.month, date.day];
}

CG_INLINE BOOL
MEDateEqual(MEDate d1, MEDate d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
}
