//
//  CategoryViewController.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-04-15.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "CategoryViewController.h"

@implementation CategoryViewController

-(id)init
{
    self = [super init];
    if(self) {
        list = [[NSMutableArray alloc] init];
        [list addObject:[[Category alloc]init:@"derp"]];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
        [tableView selectRowIndexes:indexSet byExtendingSelection:NO];
    }
    return self;
}

-(void)setData:(NSMutableArray*)arr
{
    list = arr;
    [tableView reloadData];
}

-(void)reloadData
{
    [tableView reloadData];
}

-(Category*)getSelectedRow
{
    if([tableView selectedRow] != -1)
        return [list objectAtIndex:[tableView selectedRow]];
    else
        return nil;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [list count];
}

- (NSView *)tableView:(NSTableView *)tableView1 viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	CategoryCellView *result = [tableView1 makeViewWithIdentifier:tableColumn.identifier owner:self];
	Category *item = [list objectAtIndex:row];
    result.textField.stringValue = item.name;
    [result.badge setEnabled:NO];
    result.badge.title = [NSString stringWithFormat:@"%ld", (unsigned long)[[[list objectAtIndex:row] getSnippets] count]];
	return result;
    
}
/*
-(void)updateBadge
{
    result.badge.title = [NSString stringWithFormat:@"%ld", (unsigned long)[result.badge.title]];
} */
/*
 CellView *result = [tableView1 makeViewWithIdentifier:tableColumn.identifier owner:self];
 Snippet *item = [list objectAtIndex:row];
 result.imageView.image = item.img;
 result.detailTextField.stringValue = item.description;
 result.textField.stringValue = item.url;
 
 */

-(IBAction) onTableSelection: (id) sender {
    NSInteger selectedRow = [tableView selectedRow];
    if (selectedRow != -1) 
        [SnippetsTable setData:[[list objectAtIndex:selectedRow] getSnippets]];
}


@end
