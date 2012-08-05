//
//  METimeFormat.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

CG_INLINE NSString*
FloatToTimeString(CGFloat f) {
    return [[NSString stringWithFormat:@"%.2f", f] stringByReplacingOccurrencesOfString:@"." withString:@":"];
}

CG_INLINE NSString*
TimeIntervalString(CGFloat from, CGFloat to) {
    NSString *sfrom = FloatToTimeString(from);
    NSString *sto = FloatToTimeString(to);
    
    return [NSString stringWithFormat:@"%@ ~ %@", sfrom, sto];
}

CG_INLINE NSString*
MonthToAbbreviationString(NSInteger month) {
    static NSString *months[] = {@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"};
    
    return months[month - 1];
}
