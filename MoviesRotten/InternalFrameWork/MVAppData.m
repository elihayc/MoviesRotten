//
//  MVAppData.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVAppData.h"

@implementation MVAppData

+ (id)sharedInstance
{
    static MVAppData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    self = self = [super init];
    
    if (self)
    {
        self.faceBookMgr = [MVFacebookManager new];
    }
    return self;
}

@end
