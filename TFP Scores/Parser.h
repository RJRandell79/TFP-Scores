//
//  Parser.h
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "List.h"

@interface Parser : NSObject <NSXMLParserDelegate> {
    
    AppDelegate *app;
    List *theList;
    NSMutableString *currentElementValue;
}

- (id) initParser;

@end
