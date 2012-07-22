//
//  MENavigationController.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/10/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MENavigationController.h"
#import <QuartzCore/CoreAnimation.h>

#define SHADOW_LAYER_NAME @"shadow"

@interface UINavigationController (Private)

- (BOOL)containsShadowSublayer;

@end

@implementation UINavigationController (MENavigationController)

- (void)viewWillAppear:(BOOL)animated {
    if (![self containsShadowSublayer]) {
        CGColorRef darkColor = [[UIColor blackColor] colorWithAlphaComponent:.5f].CGColor;
        CGColorRef lightColor = [UIColor clearColor].CGColor;
    
        CGFloat navigationBarBottom = self.navigationBar.frame.origin.y + self.navigationBar.frame.size.height;
    
        CAGradientLayer *shadow = [[[CAGradientLayer alloc] init] autorelease];
        shadow.frame = CGRectMake(0, navigationBarBottom, self.view.frame.size.width, 10);
        shadow.colors = [NSArray arrayWithObjects:(id)darkColor, (id)lightColor, nil];
        shadow.name = SHADOW_LAYER_NAME;
        [self.view.layer addSublayer:shadow];
    }
    
    [super viewWillAppear:animated];
}

- (BOOL)containsShadowSublayer {
    for (CALayer *sublayer in [self.view.layer sublayers]) {
        if ([sublayer.name isEqualToString:SHADOW_LAYER_NAME]) {
            return YES;
        }
    }
    return NO;
}

@end
