//
//  METimeFormat.h
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

CG_INLINE NSString*
FloatToTimeString(CGFloat f)
{
    return [[NSString stringWithFormat:@"%.2f", f] stringByReplacingOccurrencesOfString:@"." withString:@":"];
}
