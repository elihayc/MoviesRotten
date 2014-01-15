//
//  MVSplashViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVSplashViewController.h"
#import "MVUserRepository.h"

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
                                NSString* profileId = [notification userInfo][@"profileId"];
                                self.appData.user = [[MVUserRepository sharedInstance] loadUserbyFBID:profileId];
                                UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
                                UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:VIEW_ID_MAIN];
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
