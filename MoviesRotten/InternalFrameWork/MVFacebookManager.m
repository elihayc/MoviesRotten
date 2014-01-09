//
//  MVFacebookManager.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVFacebookManager.h"
#import "FacebookSdk/FacebookSDK.h"


@implementation MVFacebookManager

- (BOOL)IsUserConnected
{
    return FBSession.activeSession.isOpen;
}

@end
