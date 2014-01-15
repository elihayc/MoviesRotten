//
//  MVUser.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVUser.h"

@implementation MVUser

NSString * const KEY_FISRT_NAME = @"firstName";
NSString * const KEY_LAST_NAME = @"lastName";
NSString * const KEY_FB_ID = @"faceBookID";
NSString * const KEY_FAVORITE_MOVIES = @"favoriteMovies";

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.favoriteMovies = [NSMutableArray new];
    }
    
    return self;
}

+ (instancetype)createWithFirstName:(NSString*)firstName
                     lastName:(NSString*)lastName
            facebookProfileID:(NSString*)facebookProfileID
{
    MVUser* user = [MVUser new];
    user.firstName = firstName;
    user.lastName = lastName;
    user.faceBookProfileID = facebookProfileID;
    
    return user;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if(self)
    {
        self.firstName = [decoder decodeObjectForKey:KEY_FISRT_NAME];
        self.lastName = [decoder decodeObjectForKey:KEY_LAST_NAME];
        self.faceBookProfileID = [decoder decodeObjectForKey:KEY_FB_ID];
        self.favoriteMovies = [decoder decodeObjectForKey:KEY_FAVORITE_MOVIES];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.firstName forKey:KEY_FISRT_NAME];
    [encoder encodeObject:self.lastName forKey:KEY_LAST_NAME];
    [encoder encodeObject:self.faceBookProfileID forKey:KEY_FB_ID];
    [encoder encodeObject:self.favoriteMovies forKey:KEY_FAVORITE_MOVIES];
}

@end
