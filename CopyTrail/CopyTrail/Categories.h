//
//  Categories.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"

@interface Categories : NSObject

//Properties
@property (readonly) NSMutableArray *categories;

//Methods
-(NSMutableArray*)getCategories;
-(Category*)getCategory:(int)number;
-(void)addCategory:(Category*)cat;
-(void)removeCategory:(Category*)obj;

//Constructor
-(Categories*) init;

@end
