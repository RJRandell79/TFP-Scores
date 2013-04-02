//
//  MasterViewController.h
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "List.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, retain) AppDelegate *app;
@property (nonatomic, retain) List *theList;

- (IBAction)refresh:(UIButton *)sender;

@end
