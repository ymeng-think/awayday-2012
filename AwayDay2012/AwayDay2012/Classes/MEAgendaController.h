//
//  MEAgendaController.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEAgendaView.h"

@interface MEAgendaController : UIViewController <MEAgendaDelegate> {
    NSArray *agendaList;
}

@end
