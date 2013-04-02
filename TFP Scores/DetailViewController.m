//
//  DetailViewController.m
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize theList, detailAwayTeamLabel, detailScoreLabel, detailVenueLabel, homeBadgeImageView, awayBadgeImageView, detailHomeScorersLabel, detailAwayScorersLabel;

@synthesize detailItem = _detailItem;
@synthesize detailAwayTeam = _detailAwayTeam;
@synthesize detailScore = _detailScore;
@synthesize detailVenue = _detailVenue;
@synthesize detailHomeBadge = _detailHomeBadge;
@synthesize detailAwayBadge = _detailAwayBadge;
@synthesize detailHomeScorers = _detailHomeScorers;
@synthesize detailAwayScorers = _detailAwayScorers;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

- (void)dealloc
{
    [_detailItem release];
    [_detailDescriptionLabel release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = _detailItem;
        self.detailAwayTeamLabel.text = _detailAwayTeam;
        self.detailScoreLabel.text = _detailScore;
        self.detailVenueLabel.text = _detailVenue;
        self.homeBadgeImageView.image = [UIImage imageNamed:_detailHomeBadge];
        self.awayBadgeImageView.image = [UIImage imageNamed:_detailAwayBadge];
        self.detailHomeScorersLabel.text = _detailHomeScorers;
        self.detailAwayScorersLabel.text = _detailAwayScorers;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    int possessionNumber = arc4random() % 277;
    NSLog(@"%i", possessionNumber);
    
    int homeShotsNumber = arc4random() % 138;
    NSLog(@"%i", homeShotsNumber);
    
    int awayShotsNumber = arc4random() % 138;
    NSLog(@"%i", awayShotsNumber);
    
    possession = [[UIImageView alloc] initWithFrame:CGRectMake(16, 279, 0, 23)];
    [possession setBackgroundColor:[UIColor colorWithRed:0.06 green:0.13 blue:0.38 alpha:0.5]];
    [possession setAlpha:0.0f];
    
    homeShotsOn = [[UIImageView alloc] initWithFrame:CGRectMake(16, 329, 0, 23)];
    [homeShotsOn setBackgroundColor:[UIColor colorWithRed:0.06 green:0.13 blue:0.38 alpha:0.5]];
    [homeShotsOn setAlpha:0.0f];
    
    awayShotsOn = [[UIImageView alloc] initWithFrame:CGRectMake(166, 329, 0, 23)];
    [awayShotsOn setBackgroundColor:[UIColor colorWithRed:0.06 green:0.13 blue:0.38 alpha:0.5]];
    [awayShotsOn setAlpha:0.0f];
    
    [self.view addSubview:possession];
    [self.view addSubview:homeShotsOn];
    [self.view addSubview:awayShotsOn];
    
    [UIView animateWithDuration:2.0f
                            delay:0.25f
                          options:UIViewAnimationCurveEaseOut
                       animations:^(void) {
                           possession.frame = CGRectMake(16, 279, possessionNumber, 23);
                           possession.alpha = 1.0f;
                       }
                       completion:NULL];
    
    [UIView animateWithDuration:2.0f
                          delay:0.25f
                        options:UIViewAnimationCurveEaseOut
                     animations:^(void) {
                         homeShotsOn.frame = CGRectMake(16, 329, homeShotsNumber, 23);
                         homeShotsOn.alpha = 1.0f;
                     }
                     completion:NULL];
    
    [UIView animateWithDuration:2.0f
                          delay:0.25f
                        options:UIViewAnimationCurveEaseOut
                     animations:^(void) {
                         awayShotsOn.frame = CGRectMake(166, 329, awayShotsNumber, 23);
                         awayShotsOn.alpha = 1.0f;
                     }
                     completion:NULL];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
