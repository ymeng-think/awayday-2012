//
//  MEAgendaController.h
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEAgendaView.h"

@class MEAgendaList;

@interface MEAgendaController : UIViewController <MEAgendaDelegate> {
    MEAgendaList *allAgendaList;
    MEAgendaList *agendaList;
    MEAgendaView *agendaView;
    
    UIBarButtonItem *favoriteButton, *doneButton;
}

@end
