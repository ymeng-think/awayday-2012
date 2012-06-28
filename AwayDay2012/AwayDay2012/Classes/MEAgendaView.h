//
//  MEAgendaView.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/19/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MEAgendaView;

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


@protocol MEAgendaDelegate

- (NSInteger)agenda:(MEAgendaView *)agenda scheduleNumInDay:(MEDate)date;
- (void)agenda:(MEAgendaView *)agenda cell:(UITableViewCell *)cell atIndex:(NSInteger)index inDay:(MEDate)date;

@end

@interface MEAgendaView : UIView <UITableViewDataSource> {
    UITableView *plan;
    
    id<NSObject, MEAgendaDelegate> delegate;
}

@property (nonatomic, retain) id<NSObject, MEAgendaDelegate> delegate;

@end
