//
//  CellView.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-04-03.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CellView : NSTableCellView

@property (nonatomic, retain) IBOutlet NSTextField *detailTextField;

@end