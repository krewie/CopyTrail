//
//  Snippet.m
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import "Snippet.h"

@implementation Snippet
@synthesize url = _url;
@synthesize description = _description;
@synthesize img = _img;

-(Snippet*) init:(NSString *)url description:(NSString*)desc img:(NSImage*)image
{
    self = [super init];
    if(self) {
        [self setUrl:url];
        [self setDescription:desc];
        [self setImg:image];
        [self AppfocusInfo];
    }
    return self;
}

-(void)setUrl:(NSString *)url
{
    _url = url;
}

-(NSString*)getUrl
{
    return _url;
}

-(void)setDescription:(NSString *)description
{
    _description = description;
}

-(NSString *)getDescription
{
    return _description;
}

-(void)setImg:(NSImage *)img
{
    _img = img;
}

-(NSImage *)getImg
{
    return _img;
}

-(void)AppfocusInfo
{
    AXUIElementRef _systemWideElement;
    AXUIElementRef _focusedApp;
    CFTypeRef _focusedWindow;
    CFTypeRef _title;
    pid_t pid;
    
    _systemWideElement = AXUIElementCreateSystemWide();
    
    AXUIElementCopyAttributeValue(_systemWideElement,
                                  (CFStringRef)kAXFocusedApplicationAttribute,(CFTypeRef*)&_focusedApp);
    AXUIElementCopyAttributeValue((AXUIElementRef)_focusedApp,
                                  (CFStringRef)NSAccessibilityFocusedWindowAttribute,(CFTypeRef*)&_focusedWindow);
    
    if(AXUIElementCopyAttributeValue(_focusedWindow, (CFStringRef)NSAccessibilityTitleAttribute, (CFTypeRef *)&_title) == kAXErrorSuccess) {
        NSString *title = (__bridge NSString *) _title;
        if (_title != NULL)
            [self setDescription:title];
    }
    AXUIElementGetPid(_focusedApp, &pid);
    [self setImg:[[NSRunningApplication runningApplicationWithProcessIdentifier:pid] icon]];
    
}


@end
