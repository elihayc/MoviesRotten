//
//  MVMovieClip.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/16/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVMovieClip : NSObject
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * duration;
@property (nonatomic, strong) NSString * thumbnail;
@property (nonatomic, strong) NSDictionary* links; //key=alternate
@end
