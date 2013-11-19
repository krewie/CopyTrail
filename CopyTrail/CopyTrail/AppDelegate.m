//
//  AppDelegate.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-23.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "AppDelegate.h"

@interface  AppDelegate()
@end

@implementation AppDelegate
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window setContentBorderThickness:24.0 forEdge:NSMinYEdge];
    [window autorecalculatesContentBorderThicknessForEdge:NO];
    if(!AXAPIEnabled()){
        //exit ALERT!
        NSLog(@"Exit and enable assistive devices, App closing...");
        [NSApp terminate:nil];
        
    }
    
    _Collection = [[Categories alloc] init];
    Category *Default = [[Category alloc] init:@"default"];
    Category *Code = [[Category alloc] init:@"Code"];
    [Default addSnippet:[[Snippet alloc]init:@"hurrs" description:@"durr" img:nil]];
     
    [_Collection addCategory:Default];
    [_Collection addCategory:Code];
    [_CategoryTable setData:[_Collection getCategories]];
    
    /*
     Monitors Ctrl + C / Ctrl + v events and acts accordingly.
     */
   
    [NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask) handler:^(NSEvent *event){
        NSUInteger copy_key = 8;                    // 8 is copy event
        NSUInteger paste_key = 9;                   // 9 is paste event
        NSUInteger modifier = NSCommandKeyMask;     // Command key event
        if ([event keyCode] == copy_key && [NSEvent modifierFlags] == modifier){
            //Check to see if it is a string and not something else!
            [self performSelector:@selector(add) withObject:self afterDelay:0.1 ];
        }
        else if([event keyCode] == paste_key && [NSEvent modifierFlags] == modifier) {
            [self copy:[_SnippetsTable getSelectedRow]];
        }
    }];
    
}

-(IBAction)DoneButton:(id)sender
{
    //Doesn't cover the case where we only have spaces in the name.
    if(![_category_name.stringValue isEqualToString:@""])
    {
        [_Collection addCategory:[[Category alloc]init:_category_name.stringValue]];
        [_CategoryTable reloadData];
        [_add_popover close];
    }
}
-(IBAction)CancelButton:(id)sender
{
    [_add_popover close];
}

-(IBAction) addCategory:(id)sender
{
    if(![_add_popover isShown])
        [_add_popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMinYEdge];
    else
        [_add_popover close];
}

-(IBAction) deleteCategory:(id)sender
{
    if([_CategoryTable getSelectedRow] != nil) {
        [_Collection removeCategory:[_CategoryTable getSelectedRow]];
        [_CategoryTable reloadData];
        [_SnippetsTable setData:nil];
    }
}

-(void)add{
    [_SnippetsTable addSnippet:[self paste]];
}


-(void)copy:(NSString*)text
{
    /* Access to pasteboard */
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    /* Clear pasteboard before copy */
    [pasteboard clearContents];
    /* write to pasteboard */
    NSArray *copiedObjects = [NSArray arrayWithObject:text];
    [pasteboard writeObjects:copiedObjects];

}

-(NSString*)paste
{
    /* Access to pasteboard */
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    
    NSArray *classArray = [NSArray arrayWithObject:[NSString class]];
    NSDictionary *options = [NSDictionary dictionary];
    
    BOOL ok = [pasteboard canReadObjectForClasses:classArray options:options];
    if (ok) {
        NSArray *objectsToPaste = [pasteboard readObjectsForClasses:classArray options:options];
        return [objectsToPaste objectAtIndex:0];
        
    }
    return NULL;
}


@end
