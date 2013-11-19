//
//  Snippet.h
//  CopyTrail
//
//  Created by Kristian Ionescu on 2013-03-30.
//  Copyright (c) 2013 Kristian Ionescu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Snippet : NSObject

//Properties
@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSString *description;
@property (nonatomic, readonly) NSImage *img;

//Methods
-(void)setUrl:(NSString *)url;
-(NSString*)getUrl;
-(void)setDescription:(NSString *)description;
-(NSString*)getDescription;
-(void)setImg:(NSImage *)img;
-(NSImage*)getImg;
-(Snippet*) init:(NSString *)str description:(NSString*)desc img:(NSImage*)image;
-(void)AppfocusInfo;
@end
