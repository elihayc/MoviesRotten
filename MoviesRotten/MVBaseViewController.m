//
//  MVBaseViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/10/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVBaseViewController.h"

@interface MVBaseViewController ()
@end

@implementation MVBaseViewController

- (MVAppData*)appData
{
    return [MVAppData sharedInstance];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [MVFlowManager.sharedInstance setCurrentViewController:self];

}

-(void)showLoginScreen:(BOOL)asRoot
{
    //TODO:DELETE
//    UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
//    UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];
//    [self presentViewController:loginController animated:YES completion:nil];
//
//    [self removeFromParentViewController];

    
    //    [self.navigationController popViewControllerAnimated:YES];
    
    [MVFlowManager.sharedInstance showLoginScreenAsRoot:asRoot];
    
}


@end
