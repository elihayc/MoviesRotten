//
//  MVFlowManager.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVBaseViewController.h"

typedef enum {
    pushView,
    popView,
    presentView,
    dismissView
} NavigationAction;

@interface MVFlowManager : NSObject
+ (instancetype)sharedInstance;

- (void)setCurrentViewController:(UIViewController *)viewController;

- (void)navigatewithAction:(NavigationAction)action ViewIdentifier:(NSString*)viewIdentifier data:(id)data;

- (void)pushViewController:(NSString*)viewIdentifier animated:(BOOL)animated;

-(void)popViewControllerAnimated:(BOOL)animated;

- (void)presentViewController:(NSString*)viewIdentifier animated:(BOOL)animated;

-(void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
@end
