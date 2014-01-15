//
//  MVUserProfileViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/9/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVUserProfileViewController.h"
#import "FacebookSDK/FacebookSDK.h"
#import "MVLoginViewController.h"

@interface MVUserProfileViewController ()
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userFirstName;
@property (weak, nonatomic) IBOutlet UILabel *userLastName;


@end

@implementation MVUserProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.userFirstName.text = [MVAppData sharedInstance].user.firstName;
    self.userLastName.text = [MVAppData sharedInstance].user.lastName;
    self.profilePic.profileID = [MVAppData sharedInstance].user.faceBookProfileID;
    
    //TODO: add log
}

- (IBAction)logoutClick:(UIButton *)sender
{
    [self.appData.faceBookMgr logout];
    [self showLoginScreen:NO];
    
}


@end
