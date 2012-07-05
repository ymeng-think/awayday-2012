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
#import "MELocationController.h"

@interface MEAwayDayController ()

+ (MEAgendaController *)initAgendaController;
+ (MEAgendaController *)initHotelController;

@end

@implementation MEAwayDayController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIViewController *agendaController = [[self class] initAgendaController];
        UIViewController *hotelController = [[self class] initHotelController];
        UIViewController *locationController = [[MELocationController alloc] init];
        
        NSArray *controllers = [[NSArray alloc] initWithObjects:agendaController, hotelController, locationController, nil];
        self.viewControllers = controllers;
        
        [controllers release];
        [agendaController release];
        [hotelController release];
        [locationController release];
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

+ (MEAgendaController *)initAgendaController {
    MEAgendaController *controller = [[MEAgendaController alloc] init];
    return controller;
}

+ (MEHotelController *)initHotelController {
    MEHotelController *controller = [[MEHotelController alloc] init];
    return controller;
}

@end
