//
//  ViewController.m
//  UnderLabelTestProject
//
//  Created by Guntis Treulands on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "UnderLineLabel.h"


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    UnderLineLabel *mCustomUnderLineLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(10,10,300,200)];
        
    [mCustomUnderLineLabel setFont:[UIFont systemFontOfSize:17]];
    
    [mCustomUnderLineLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    [mCustomUnderLineLabel setNumberOfLines:0];
    
    [mCustomUnderLineLabel setShouldUnderline:YES];
    
    [mCustomUnderLineLabel setTextColor:[UIColor blackColor]];
    	
    [mCustomUnderLineLabel setLineBreakMode:UILineBreakModeWordWrap];
    
    [mCustomUnderLineLabel setText:@"Vivamus auctor leo vel dui. Aliquam erat volere cubilia Curae; Cras tempor. Morbi egestas, urna non consequat tempus, nunc arcu mollis enim, eu m ante nulla, interdum vel, tristique ac, condimentum non, tellus. Proin ornare feugiat nisl. Suspendisse dolor nisl, ultrices at, eleifend vel, consequat at, dolor."];
    
    [[self view] addSubview:mCustomUnderLineLabel];
    
    [mCustomUnderLineLabel release];
    
    
    
    UnderLineLabel *mCustomStrikeOutLineLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(10,260,300,200)];
        
    [mCustomStrikeOutLineLabel setFont:[UIFont systemFontOfSize:17]];
    
    [mCustomStrikeOutLineLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    [mCustomStrikeOutLineLabel setNumberOfLines:0];
    
    [mCustomStrikeOutLineLabel setShouldStrikeOut:YES];
    
    //[mCustomStrikeOutLineLabel setUnderLineOffset:-8];
    
    [mCustomStrikeOutLineLabel setTextAlignment:UITextAlignmentCenter];
    
    [mCustomStrikeOutLineLabel setTextColor:[UIColor blackColor]];
    	
    [mCustomStrikeOutLineLabel setLineBreakMode:UILineBreakModeWordWrap];
    
    [mCustomStrikeOutLineLabel setText:@"Nunc auctor bibendum eros. Maecenas  br et, lacinia sit sed, suscipit eu, eros. Etiau, lectus. Nam cursus. Vivamus iaculis. Aenean risus purus, pha sad sa bl ss andit quis, gravida a, turpis. Donec nisl. Aenean eget mi. Fusce mattis est id diam. Phasellus faucibus interdum sapien. Duis quis nunc. Sed enim."];
    
    [[self view] addSubview:mCustomStrikeOutLineLabel];
    
    [mCustomStrikeOutLineLabel release];
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
