//
//  Parser.m
//  TFP Scores
//
//  Created by Rob Randell on 16/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Parser.h"

@implementation Parser

- (id) initParser {
    if (self == [super init]) {
        app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"premier"]) {
        app.scoreArray = [[NSMutableArray alloc] init];
    }
    else if ([elementName isEqualToString:@"fixture"]) {
        theList = [[List alloc] init];
        theList.fixtureID = [[attributeDict objectForKey:@"id"] integerValue];
    }    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else 
        [currentElementValue appendString:string];
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"premier"]) {
        return;
    }
    if ([elementName isEqualToString:@"fixture"]) {
        [app.scoreArray addObject:theList];
        theList = nil;
    } else 
        [theList setValue:currentElementValue forKey:elementName];
        currentElementValue = nil;
    
}

@end
