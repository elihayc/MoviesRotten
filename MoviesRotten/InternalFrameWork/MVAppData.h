//
//  MVAppData.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVFacebookManager.h"

@interface MVAppData : NSObject

+ (id)sharedInstance;

@property (nonatomic, strong) MVFacebookManager * faceBookMgr;
@end
