//
//  MEHeadPortraitCell.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEHeadPortraitCell.h"

#define HEAD_PORTRAIT_NUM   4

@interface MEHeadPortraitCell ()

- (void)addHeadPortaitImageViews;

@end

static CGSize kHeadPortraitSize;

@implementation MEHeadPortraitCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addHeadPortaitImageViews];
    }
    return self;
}

- (void)addHeadPortaitImageViews {
    for (NSInteger i = 0; i < HEAD_PORTRAIT_NUM; i++) {
        UIImageView *headPortraitView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jie.xiong.png"]];
        [self.contentView addSubview:headPortraitView];
        [headPortraitView release];
    }
}

- (void)layoutSubviews {
    CGFloat paddingX = (self.bounds.size.width - HEAD_PORTRAIT_NUM * kHeadPortraitSize.width) / 5;
    CGFloat paddingY = paddingX;
    
    CGFloat x = paddingX;
    CGFloat y = paddingY;
    for (NSInteger i = 0; i < HEAD_PORTRAIT_NUM; i++) {
        UIImageView *headPortraitView = [self.contentView.subviews objectAtIndex:i];
        CGRect newFrame = headPortraitView.frame;
        newFrame.origin = CGPointMake(x, y);
        newFrame.size = kHeadPortraitSize;
        headPortraitView.frame = newFrame;
        
        x += kHeadPortraitSize.width + paddingX;
    }
}

+ (void)initialize {
    kHeadPortraitSize = CGSizeMake(57, 57);
}

@end
