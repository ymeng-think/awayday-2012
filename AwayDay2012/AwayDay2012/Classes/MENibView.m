//
//  MENibView.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MENibView.h"

@implementation MENibView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (id)loadFromNib {
    NSString *nibName = [[self class] nibName];
    if (!nibName) {
        return nil;
    }
    
    NSArray *contents = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    if (contents == nil) {
        return nil;
    }
    
    for (id item in contents) {
        if ([item isKindOfClass:[self class]]) {
            return [item autorelease];
        }
    }

    return nil;
}

+ (NSString *)nibName {
    return nil;
}

@end
