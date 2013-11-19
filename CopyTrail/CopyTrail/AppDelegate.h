//
//  AppDelegate.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-23.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TableViewController.h"
#import "CategoryViewController.h"
#import "Categories.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property Categories *Collection;
@property IBOutlet CategoryViewController *CategoryTable;
@property IBOutlet TableViewController *SnippetsTable;
@property (assign) IBOutlet NSWindow *window;

@property IBOutlet NSPopover *add_popover;
@property IBOutlet NSTextField *category_name;

-(IBAction)DoneButton:(id)sender;
-(IBAction)CancelButton:(id)sender;

-(IBAction) addCategory:(id)sender;
-(IBAction) deleteCategory:(id)sender;

-(NSString*)paste;
-(void)copy:(NSString*)text;


@end

