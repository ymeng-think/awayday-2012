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

@end

@implementation MEAwayDayController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    agendaController = [[MEAgendaController alloc] init];
    hotelController = [[MEHotelController alloc] init];
    locationController = [[MELocationController alloc] init];
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:agendaController, hotelController, locationController, nil];
    self.viewControllers = controllers;
    
    [controllers release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
    [agendaController release];
    [hotelController release];
    [locationController release];
    
    [super dealloc];
}

@end
