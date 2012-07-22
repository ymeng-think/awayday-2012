//
//  MEHeadPortraitCell.m
//  AwayDay2012
//
//  Created by Meng Yu on 7/22/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MELecturerCell.h"
#import "MEHeadPortrait.h"

#define HEAD_PORTRAIT_NUM   4

@interface MELecturerCell ()

- (void)addHeadPortaitImageViews;

@end

static CGSize kHeadPortraitSize;

@implementation MELecturerCell

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
        MEHeadPortrait *headPortraitView = [[MEHeadPortrait alloc] initWithFrame:CGRectMake(0, 0, kHeadPortraitSize.width, kHeadPortraitSize.height)];
        [headPortraitView setLecture:@"jie.xiong"];
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
        MEHeadPortrait *headPortraitView = [self.contentView.subviews objectAtIndex:i];
        CGRect newFrame = headPortraitView.frame;
        newFrame.origin = CGPointMake(x, y);
        headPortraitView.frame = newFrame;
        
        x += kHeadPortraitSize.width + paddingX;
    }
}

+ (void)initialize {
    kHeadPortraitSize = CGSizeMake(57, 92);
}

@end
