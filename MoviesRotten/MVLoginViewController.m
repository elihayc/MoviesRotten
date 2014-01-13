//
//  MVLoginViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVLoginViewController.h"
#import "FacebookSDK/FacebookSDK.h"

@interface MVLoginViewController () <FBLoginViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *fbName;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;


@end

@implementation MVLoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    if ([self.appData.faceBookMgr isUserConnected])
    {
        NSLog(@"connected");
       //TODO:DELETE
       // [self performSegueWithIdentifier: @"SegueToMain" sender: self];
    }
    else
    {
        NSLog(@"not connected");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    FBLoginView *loginView = [FBLoginView new];
    [self.view addSubview:loginView];
    loginView.delegate = self;
    loginView.frame = CGRectOffset(loginView.frame, 50, 50);
    loginView.readPermissions = @[@"basic_info",@"email",@"user_likes"];
}


- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    //TODO: DELETE
    self.fbName.text = user.name;
    self.profilePictureView.profileID = user.id;
    
    [[MVAppData sharedInstance] saveUserWithFirstName:user.first_name
                                             lastName:user.last_name
                                            profileID:user.id];
    
    NSLog(@"loginViewFetchedUserInfo username: %@", user.name);
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"%@", @"login");
    //TODO: DELETE [self performSegueWithIdentifier: @"SegueToMain" sender: self];
    //TODO: DELETE[self dismissViewControllerAnimated:YES completion:nil];
    
    UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
    UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];
    [self.navigationController pushViewController:mainController animated:YES];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.fbName.text = nil;
    self.profilePictureView.profileID = nil;
     NSLog(@"%@", @"logout");
}
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"%@",@"error");
}


@end
