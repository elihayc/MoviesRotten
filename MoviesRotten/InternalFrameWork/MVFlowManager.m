//
//  MVFlowManager.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVFlowManager.h"
#import "MVMovieDetailViewController.h"
#import "MVLoginViewController.h"

@interface MVFlowManager()
@property (nonatomic, weak) UIViewController* viewController;

@end

@implementation MVFlowManager

+ (instancetype)sharedInstance
{
    static MVFlowManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)setCurrentViewController:(UIViewController *)viewController
{
    self.viewController = viewController;
}

- (void)showMovieDetails:(MVMovie *)movie;
{
    MVMovieDetailViewController * movieViewController = [self getViewFromStoryBoardWithIdentifier:VIEW_ID_MOVIE_DETAILS];
    movieViewController.movie = movie;
    [self.viewController.navigationController pushViewController:movieViewController
                                                        animated:YES];
}

- (void)showLoginScreenAsRoot:(BOOL)isRoot
{
    MVLoginViewController * loginViewController = [self getViewFromStoryBoardWithIdentifier:VIEW_ID_LOGIN];
    loginViewController.isRoot = isRoot;
    [self.viewController presentViewController:loginViewController animated:YES completion:nil];
}

//private methods

-(id) getViewFromStoryBoardWithIdentifier:(NSString*)viewIdentifier
{
    UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
    return [storyboard instantiateViewControllerWithIdentifier:viewIdentifier];

}

@end
