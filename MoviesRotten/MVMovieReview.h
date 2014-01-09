//
//  MVMovieReview.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVMovieReview : NSObject

@property (nonatomic, strong) NSString * critic;
@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSString * freshness;
@property (nonatomic, strong) NSString * publication;
@property (nonatomic, strong) NSString * quote;
@property (nonatomic, strong) NSMutableArray * links; //strings

@end
