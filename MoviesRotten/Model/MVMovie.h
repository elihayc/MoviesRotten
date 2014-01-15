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
@property (nonatomic, strong) NSMutableArray * ratings; // key value pairs

@property (nonatomic, strong) NSArray * posters; // key value pairs (key:name, value:imgaeUrl)
@property (nonatomic, strong) NSMutableArray * abridgedCast;
@property (nonatomic, strong) NSArray * abridgedDirectors; // key value pairs
@property (nonatomic, strong) NSString * studio;
@property (nonatomic, strong) NSMutableArray * alternateIds; // key value pairs
@property (nonatomic, strong) NSMutableArray * links; // key value pairs

@end
