//
//  MVUser.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVUser : NSObject <NSCoding>

+ (instancetype)createWithFirstName:(NSString*)firstName
                         lastName:(NSString*)lastName
                facebookProfileID:(NSString*)facebookProfileID;

@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* faceBookProfileID;
@property (nonatomic, strong) NSMutableArray * favoriteMovies;



@end
