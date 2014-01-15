//
//  MVMovieRepository.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/15/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVUserRepository : NSObject

+ (instancetype)sharedInstance;

- (MVUser*)loadUserbyFBID:(NSString*)facebookProfileID;

- (MVUser*)saveUser:(MVUser*)user;

@end
