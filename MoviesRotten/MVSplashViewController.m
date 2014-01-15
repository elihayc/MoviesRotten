//
//  MVSplashViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVSplashViewController.h"

@interface MVSplashViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@end

@implementation MVSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backImage.image = [UIImage imageNamed:@"Default"];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(facebookConnectionChanged:)
                   name:FB_STATUS_CHANGED
                 object:nil];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    [self.appData.faceBookMgr tryConnectWithPreviousToken];
    
}

-(void)facebookConnectionChanged:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [UIView animateWithDuration:2.5f
                          delay:2.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.view.alpha = .0f;
                     } completion:^(BOOL finished){
                         if (finished)
                         {
                             if ([self.appData.faceBookMgr isUserConnected])
                             {
                                //TODO: add to FlowManager
                                UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
                                UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];//TODO mainScreen as const

                                [self presentViewController:mainController animated:YES completion:nil];
                             }
                             else
                             {
                                 [self showLoginScreen:YES];
                             }
                             [self removeFromParentViewController];
                         }
                     }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
