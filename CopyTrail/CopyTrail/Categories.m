//
//  Categories.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "Categories.h"

@implementation Categories
@synthesize categories = _categories;

-(Categories*)init
{
    self = [super init];
    if(self) {
        _categories = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray*)getCategories
{
    return _categories;
}

-(Category*)getCategory:(int)number
{
    return [_categories objectAtIndex:number];
}

-(void)addCategory:(Category *)cat
{
    [_categories addObject:cat];
}

-(void)removeCategory:(Category*)obj
{
    [_categories removeObject:obj];
}
@end
