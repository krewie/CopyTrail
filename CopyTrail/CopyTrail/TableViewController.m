//
//  TableViewController.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-31.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "TableViewController.h"
#import "CellView.h"

@implementation TableViewController

-(id)init
{
    self = [super init];
    if(self) {
        //list = [[NSMutableArray alloc]init];
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

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [list count];
}

-(NSString*)getSelectedRow
{
    return [[list objectAtIndex:[tableView selectedRow]] getUrl];
}

- (NSView *)tableView:(NSTableView *)tableView1 viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	CellView *result = [tableView1 makeViewWithIdentifier:tableColumn.identifier owner:self];
	Snippet *item = [list objectAtIndex:row];
    result.imageView.image = item.img;
    result.detailTextField.stringValue = item.description;
	result.textField.stringValue = item.url;
    
	return result;
}

-(void)addSnippet:(NSString*)url
{
    [list addObject:[[Snippet alloc]init:url description:nil img:nil]];
    [tableView reloadData];
}


-(void)addEntry:(NSObject*)obj
{
    [list addObject:obj];
    [tableView reloadData];
}

-(void)removeEntry
{
    [list removeLastObject];
    [tableView reloadData];
}


@end
