//
//  MVMovie.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVMovie : NSObject<NSCoding>

- (BOOL)isEqualToMVMovie:(MVMovie *)movie;

@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * title;
@property (nonatomic) NSInteger year;
@property (nonatomic, strong) NSString * synopsis;


//Not implementded for save / or for mapping from rest
@property (nonatomic, strong) NSMutableArray * genres;

@property (nonatomic, strong) NSString * mpaaRating;
@property (nonatomic) NSInteger runtime;
@property (nonatomic, strong) NSString * criticsConsensus;
@property (nonatomic, strong) NSDictionary * ratings;

@property (nonatomic, strong) NSDictionary * posters; //(key:name, value:imgaeUrl)
@property (nonatomic, strong) NSDictionary * links;
@property (nonatomic, strong) NSArray * abridgedCast;
@property (nonatomic, strong) NSDictionary * abridgedDirectors;
@property (nonatomic, strong) NSString * studio;
@property (nonatomic, strong) NSDictionary * alternateIds;


@end
