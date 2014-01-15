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
    
    MVUser* movieUser = [[MVUserRepository sharedInstance] loadUserbyFBID:user.id];
    if (!movieUser)
    {
        movieUser = [MVUser createWithFirstName:user.first_name lastName:user.last_name facebookProfileID:user.id];
    }
    
    [MVAppData sharedInstance].user = movieUser;
    
    [[MVUserRepository sharedInstance] saveUser:self.appData.user];
    
    [self closeScreen];
    
    NSLog(@"loginViewFetchedUserInfo username: %@", user.name);
}

-(void)closeScreen
{
    if (self.isRoot)
    {
        UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
        UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];
        
        [self presentViewController:mainController animated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [self removeFromParentViewController];
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"%@", @"login");
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
