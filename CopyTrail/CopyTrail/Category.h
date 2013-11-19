//
//  Category.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Snippet.h"

@interface Category : NSObject

//Properties
@property (readonly) NSString *name;
@property (readonly) NSMutableArray *snippets;


//Methods
-(void)setName:(NSString *)name;
-(NSString*)getName;
-(Snippet*)getSnippet:(int)index;
-(void)addSnippet:(Snippet*)snippet;
-(void)removeSnippet:(int)index;
-(NSMutableArray*)getSnippets;

//Constructor
-(Category*) init:(NSString *)name;

@end
