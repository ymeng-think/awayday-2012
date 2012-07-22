//
//  MEHotelController.m
//  AwayDay2012
//
//  Created by Meng Yu on 6/18/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDiscussionController.h"
#import "MEDiscussionView.h"
#import "MELecturerListLoader.h"

#define LECTURER_FILE_NAME  @"lecturer"

@interface MEDiscussionController ()

- (void)loadLecturerNameList:(NSString *)fileName;

@end

@implementation MEDiscussionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)loadView {
    UIView *view = [[MEDiscussionView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    [view release];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadLecturerNameList:LECTURER_FILE_NAME];
    NSLog(@"name list contains: %@", lecturerNameList);
    
    [super viewWillAppear:animated];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loadLecturerNameList:(NSString *)fileName {
    MELecturerListLoader *loader = [[MELecturerListLoader alloc] init];
    self->lecturerNameList = [[loader loadFromFile:fileName] retain];
    [loader release];
}

- (void)dealloc {
    [self->lecturerNameList release];
    
    [super dealloc];
}

@end
