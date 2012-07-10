//
//  MEAwayDayController.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAwayDayController.h"
#import "MEAgendaController.h"
#import "MEHotelController.h"
#import "MENavigationController.h"

#define TAB_NAME_AGENDA @"AGENDA"
#define TAB_NAME_HOTEL  @"HOTEL"

@interface MEAwayDayController ()

+ (UIViewController *)initAgendaController;
+ (UIViewController *)initHotelController;

@end

@implementation MEAwayDayController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIViewController *agendaController = [[self class] initAgendaController];
        UIViewController *hotelController = [[self class] initHotelController];
        
        NSArray *controllers = [[NSArray alloc] initWithObjects:agendaController, hotelController, nil];
        self.viewControllers = controllers;
        
        [controllers release];
        [agendaController release];
        [hotelController release];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.   
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

+ (UIViewController *)initAgendaController {   
    MEAgendaController *controller = [[MEAgendaController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [controller release];
    navController.tabBarItem.title = TAB_NAME_AGENDA;

    return navController;
}

+ (UIViewController *)initHotelController {
    MEHotelController *controller = [[MEHotelController alloc] init];
    controller.tabBarItem.title = TAB_NAME_HOTEL;
    return controller;
}

@end
