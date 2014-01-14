//
//  MVFlowManager.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVFlowManager.h"
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

- (void)navigatewithAction:(NavigationAction)action ViewIdentifier:(NSString*)viewIdentifier data:(id)data
{
    
}

- (void)pushViewController:(NSString*)viewIdentifier animated:(BOOL)animated
{
    
    [self.viewController.navigationController pushViewController:[self getViewFromStoryBoardWithIdentifier:viewIdentifier]
                                                        animated:animated];
}

-(void)popViewControllerAnimated:(BOOL)animated
{
    [self.viewController.navigationController popViewControllerAnimated:animated];
}

- (void)presentViewController:(NSString*)viewIdentifier animated:(BOOL)animated
{
    
    [self.viewController presentViewController:[self getViewFromStoryBoardWithIdentifier:viewIdentifier]
                                      animated:animated completion:nil];
}

-(void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [self.viewController dismissViewControllerAnimated:animated completion:completion];
}

//private methods

-(UIViewController *) getViewFromStoryBoardWithIdentifier:(NSString*)viewIdentifier
{
    UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
    return [storyboard instantiateViewControllerWithIdentifier:viewIdentifier];

}

@end
