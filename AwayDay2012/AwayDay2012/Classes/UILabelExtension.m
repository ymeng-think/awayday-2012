//
//  UILabelExtension.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/26/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "UILabelExtension.h"
#import "MEFont.h"
#import "NSStringExtension.h"

@interface UILabel (Private)

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak;

@end

@implementation UILabel (UILabelExtension)

- (void)withColor:(UIColor *)color font:(NSString *)fontName size:(CGFloat)size {
    UIFont *font = [[MEFont sharedLibrary] fontWithName:fontName size:size];
    [self textInColor:color withFont:font linkBreak:NO];
}

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    CGSize labelSize = CGSizeZero;
    if (![NSString isEmptyOrNull:self.text]) {
        labelSize = [self.text sizeWithFont:font 
                          constrainedToSize:self.frame.size 
                              lineBreakMode:self.lineBreakMode];    
    }
    
    self.numberOfLines = 0;
    self.font = font;
    self.textColor = color;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
    if (![NSString isEmptyOrNull:self.text] && includesLineBreak) {
        self.text = [self.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    }
}

@end
