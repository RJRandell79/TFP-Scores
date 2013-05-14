//
//  AppDelegate.m
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Parser.h"
#import "MasterViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize scoreArray;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.rjrstudios.co.uk/webpages/standing_v3.xml"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    Parser *theParser = [[Parser alloc] initParser];
    
    [xmlParser setDelegate:theParser];
    
    BOOL worked = [xmlParser parse];
    
    if (worked) {
        NSLog(@"Amount %i", [scoreArray count]);
    } else {
        NSLog(@"FAIL");
    }
    
    //NSData *dataStatic = [NSData dataWithContentsOfFile:path];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:
    
    //NSData *dataStatic; //this is your xml file
    
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *docs = [paths objectAtIndex:0];
    //NSString *filename = [NSString stringWithFormat:@"scores.xml"];
    //NSString *path = [docs stringByAppendingPathComponent:filename];
    
    //[dataStatic writeToFile:paths atomically:NO];
        
}

@end
