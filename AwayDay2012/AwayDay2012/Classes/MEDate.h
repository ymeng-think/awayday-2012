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