//
//  MVMovieRepository.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/15/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVUserRepository.h"

@implementation MVUserRepository

NSString * const USER_KEY = @"user";

+ (instancetype)sharedInstance
{
    static MVUserRepository *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (MVUser*)loadUserbyFBID:(NSString*)facebookProfileID
{
    //deSerilize object from NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *archivedObject = [defaults objectForKey:[self getUserDBKey:facebookProfileID]];
    MVUser * user = (MVUser *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedObject];
    
    return user;
}

- (MVUser*)saveUser:(MVUser*)user
{
    //Save Serilize object in NSUserDefaults
    NSData *archivedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:archivedObject forKey:[self getUserDBKey:user.faceBookProfileID]];
    [defaults synchronize];
    
    return user;
}


// private methods
- (NSString*)getUserDBKey:(NSString *)faceBookProfileID
{
    return [NSString stringWithFormat:@"%@%@", USER_KEY, faceBookProfileID];
}
@end
