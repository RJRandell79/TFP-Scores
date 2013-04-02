//
//  List.h
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject

@property (nonatomic, retain) NSString *home;
@property (nonatomic, retain) NSString *away;
@property (nonatomic, retain) NSString *score;
@property (nonatomic, retain) NSString *homebadge;
@property (nonatomic, retain) NSString *homescorers;
@property (nonatomic, retain) NSString *awaybadge;
@property (nonatomic, retain) NSString *awayscorers;
@property (nonatomic, retain) NSString *venue;

@property (nonatomic, readwrite) NSInteger fixtureID;

@end
