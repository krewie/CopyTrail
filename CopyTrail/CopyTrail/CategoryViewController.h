//
//  CategoryViewController.h
//  CopyTrail
//
//
//  Created by Kristian Ionescu on 2013-04-15.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"
#import "TableViewController.h"
#import "CategoryCellView.h"

@interface CategoryViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet TableViewController *SnippetsTable;
    IBOutlet NSTableView *tableView;
    NSMutableArray *list;
}
-(IBAction) onTableSelection: (id) sender;

//methods
-(void)setData:(NSMutableArray*)arr;
-(void)reloadData;
-(Category*)getSelectedRow;
-(void)updateBadge;

@end
