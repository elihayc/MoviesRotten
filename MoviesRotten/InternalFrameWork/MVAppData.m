//
//  MVAppData.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVAppData.h"

@implementation MVAppData

NSString * const USER_KEY = @"user";

+ (instancetype)sharedInstance
{
    static MVAppData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.faceBookMgr = [MVFacebookManager new];
        self.rottenTomatoMgr = [MVRottenTomatoManager new];
        [self loadLocalData];
    }
    return self;
}

- (void)loadLocalData
{
    self.user = [MVUser new];
    
    //deSerilize object from NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *archivedObject = [defaults objectForKey:USER_KEY];
    MVUser * user = (MVUser *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedObject];
    
    if (user) self.user = user;
}

- (void)saveUserWithFirstName:(NSString*)firstName
                     lastName:(NSString*)lastName
                    profileID:(NSString*)profileId
{
    self.user.firstName = firstName;
    self.user.lastName = lastName;
    self.user.faceBookProfileID = profileId;
    
    //Save Serilize object in NSUserDefaults
    NSData *archivedObject = [NSKeyedArchiver archivedDataWithRootObject:self.user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:archivedObject forKey:USER_KEY];
    [defaults synchronize];
}


@end
