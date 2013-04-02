//
//  DetailViewController.h
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface DetailViewController : UIViewController {
    
    UIImageView *possession;
    UIImageView *homeShotsOn;
    UIImageView *awayShotsOn;
    
}

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id detailAwayTeam;
@property (strong, nonatomic) id detailScore;
@property (strong, nonatomic) id detailVenue;
@property (strong, nonatomic) id detailHomeBadge;
@property (strong, nonatomic) id detailAwayBadge;
@property (strong, nonatomic) id detailHomeScorers;
@property (strong, nonatomic) id detailAwayScorers;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailAwayTeamLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailVenueLabel;

@property (strong, nonatomic) IBOutlet UIImageView *homeBadgeImageView;
@property (strong, nonatomic) IBOutlet UIImageView *awayBadgeImageView;

@property (strong, nonatomic) IBOutlet UITextView *detailHomeScorersLabel;
@property (strong, nonatomic) IBOutlet UITextView *detailAwayScorersLabel;

@property (nonatomic, retain) List *theList;

@end
