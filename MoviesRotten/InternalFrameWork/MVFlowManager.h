//
//  MVFlowManager.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVBaseViewController.h"
#import "MVMovie.h"

typedef enum {
    pushView,
    popView,
    presentView,
    dismissView
} NavigationAction;

@interface MVFlowManager : NSObject
+ (instancetype)sharedInstance;

- (void)showMovieDetails:(MVMovie *)movie;
- (void)showLoginScreenAsRoot:(BOOL)isRoot;

- (void)setCurrentViewController:(UIViewController *)viewController;

@end
