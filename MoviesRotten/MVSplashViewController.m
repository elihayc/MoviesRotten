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
}
- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.5f
                          delay:2.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.view.alpha = .0f;
                     } completion:^(BOOL finished){
                         if (finished)
                         {
                             if ([[[MVAppData sharedInstance] faceBookMgr] IsUserConnected])
                             {
                                [self performSegueWithIdentifier:@"segueSplashToMain" sender:self];
                             }
                             else
                             {
                                 [self performSegueWithIdentifier:@"segueToLogin" sender:self];
                             }
                         }
                     }];

}
@end
