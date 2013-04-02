//
//  ScoreCell.h
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *hometeamImage;
@property (nonatomic, retain) IBOutlet UILabel *hometeam;
@property (nonatomic, retain) IBOutlet UILabel *score;
@property (nonatomic, retain) IBOutlet UIImageView *awayteamImage;
@property (nonatomic, retain) IBOutlet UILabel *awayteam;

@end
