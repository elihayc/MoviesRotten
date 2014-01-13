//
//  MVRottenTomatoManager.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVRottenLoadData.h"
@interface MVRottenTomatoManager : NSObject

- (void)loadTheatersMovies:(id<MVRottenLoadData>)delegate;
- (void)getMovieById:(NSString *)movieId delegate:(id<MVRottenLoadData>)delegate;
-(void)searchMovie:(NSString*)searchText delegate:(id<MVRottenLoadData>)delegate;
@end
