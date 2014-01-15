//
//  MVAppData.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVFacebookManager.h"
#import "MVUser.h"
#import "MVRottenTomatoManager.h"
@interface MVAppData : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) MVUser * user;
@property (nonatomic, strong) MVFacebookManager * faceBookMgr;
@property (nonatomic, strong) MVRottenTomatoManager * rottenTomatoMgr;

@end
