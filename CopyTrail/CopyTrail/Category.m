//
//  Category.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "Category.h"

@implementation Category
@synthesize name = _name;
@synthesize snippets = _snippets;

-(Category*) init:(NSString *)name
{
    self = [super init];
    if(self) {
        [self setName:name];
        _snippets = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setName:(NSString *)name
{
    _name = name;
}

-(NSString*)getName
{
    return _name;
}


-(Snippet*)getSnippet:(int)index
{
    return [_snippets objectAtIndex:index];
}

-(void)addSnippet:(Snippet*)snippet
{
    [_snippets addObject:snippet];
}

-(void)removeSnippet:(int)index
{
    [_snippets removeObjectAtIndex:index];
}

;
-(NSMutableArray*)getSnippets
{
    return _snippets;
}


@end
