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
                             //TODO: DELETE
                             //    NSString * segueName = nil;
                             //    segueName = [self.appData.faceBookMgr isUserConnected] ? SEG_SPLASH_TO_MAIN : SEG_SPLASH_TO_LOGIN;
                             
//  TODO:DELETE                [self performSegueWithIdentifier:SEG_SPLASH_TO_MAIN sender:self];

                             UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
                             UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];//TODO loginScreen as const
                             
                             
                             
                             [self.navigationController pushViewController:loginController animated:NO];
                             if ([self.appData.faceBookMgr isUserConnected])
                             {
                                 UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];//TODO mainScreen as const
                                 [self.navigationController pushViewController:mainController animated:YES];
                             }
                         }
                     }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
