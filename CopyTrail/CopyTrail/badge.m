//
//  badge.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-04-19.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "badge.h"

@implementation badge

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
    if (![self isEnabled]) {
        NSLog(@"%@", [[self attributedTitle] description]);
        return [super drawTitle:[self attributedTitle] withFrame:frame inView:controlView];
    }
    
    return [super drawTitle:title withFrame:frame inView:controlView];
}

@end
