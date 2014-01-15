//
//  MVAppData.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVAppData.h"

@implementation MVAppData



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
    
    //TODO:delete
// self.user = [MVUser new];
//    
//    //deSerilize object from NSUserDefaults
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *archivedObject = [defaults objectForKey:USER_KEY];
//    MVUser * user = (MVUser *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedObject];
//    
//    if (user) self.user = user;
}




@end
