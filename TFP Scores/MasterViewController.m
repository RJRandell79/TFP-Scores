//
//  MasterViewController.m
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ScoreCell.h"


@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize app;
@synthesize theList;

- (IBAction)refresh:(UIButton *)sender {
    
    [self.tableView reloadData];
    NSLog(@"Amount %i", [app.scoreArray count]);
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)dealloc
{
    [_detailViewController release];
    [theList release];
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *refreshButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)] autorelease];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abstractwaves.png"]];
    [tempImageView setFrame:self.tableView.frame]; 
    self.tableView.backgroundView = tempImageView;
    [tempImageView release];
    
    app = [[UIApplication sharedApplication] delegate];
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _objects.count;
    return [app.scoreArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ScoreCell *cell = (ScoreCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    //NSDate *object = [_objects objectAtIndex:indexPath.row];
    //cell.textLabel.text = [object description];
    
    theList = [app.scoreArray objectAtIndex:indexPath.row];
    
    NSString *hometeamTrimmed = [NSString stringWithString:[theList.home stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSString *awayteamTrimmed = [NSString stringWithString:[theList.away stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSString *homebadgeTrimmed = [NSString stringWithString:[theList.homebadge stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSString *awaybadgeTrimmed = [NSString stringWithString:[theList.awaybadge stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    cell.hometeam.text = hometeamTrimmed;
    cell.awayteam.text = awayteamTrimmed;
    cell.score.text = theList.score;
    cell.hometeamImage.image = [UIImage imageNamed:homebadgeTrimmed];
    cell.awayteamImage.image = [UIImage imageNamed:awaybadgeTrimmed];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [app.scoreArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailView = [[DetailViewController alloc] init];
    theList = [app.scoreArray objectAtIndex:indexPath.row];
    
    detailView.theList = theList;
    
    [self.navigationController pushViewController:detailView animated:YES];
    
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];        
        theList = [app.scoreArray objectAtIndex:indexPath.row];
        
        _detailViewController.theList = theList;
        
        NSString *hometeamTrimmed = [NSString stringWithString:[theList.home stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        NSString *awayteamTrimmed = [NSString stringWithString:[theList.away stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        NSString *scoreTrimmed = [NSString stringWithString:[theList.score stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        NSString *venueTrimmed = [NSString stringWithString:[theList.venue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        
        NSString *homebadgeTrimmed = [NSString stringWithString:[theList.homebadge stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        NSString *awaybadgeTrimmed = [NSString stringWithString:[theList.awaybadge stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        
        NSString *homescorersTrimmed = [NSString stringWithString:[theList.homescorers stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        NSString *awayscorersTrimmed = [NSString stringWithString:[theList.awayscorers stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];

        //NSArray *object = [app.scoreArray objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:hometeamTrimmed];
        [[segue destinationViewController] setDetailAwayTeam:awayteamTrimmed];
        [[segue destinationViewController] setDetailVenue:venueTrimmed];
        [[segue destinationViewController] setDetailScore:scoreTrimmed];
        [[segue destinationViewController] setDetailHomeBadge:homebadgeTrimmed];
        [[segue destinationViewController] setDetailAwayBadge:awaybadgeTrimmed];
        [[segue destinationViewController] setDetailHomeScorers:homescorersTrimmed];
        [[segue destinationViewController] setDetailAwayScorers:awayscorersTrimmed];

        NSLog(@"%@", hometeamTrimmed);
        NSLog(@"%@", awayteamTrimmed);

    }
}

@end
