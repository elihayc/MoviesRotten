//
//  MVUser.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVUser.h"

@implementation MVUser

- (id) init
{
    self = [super init];
    
    if (self)
    {
        self.favoriteMovies = [NSMutableArray new];
    }
    
    return self;
}
@end
