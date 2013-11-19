//
//  TableViewController.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-31.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Snippet.h"
#import "Category.h"

@interface TableViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet NSTableView *tableView;
    NSMutableArray *list;
}

//Methods
-(void)addEntry:(NSObject*)snippet;
-(void)removeEntry;
-(NSString*)getSelectedRow;
-(void)setData:(NSMutableArray*)arr;
-(void)addSnippet:(NSString*)url;
-(void)reloadData;

//Constructor
-(id)init;


@end
