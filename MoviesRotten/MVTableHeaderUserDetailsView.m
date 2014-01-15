//
//  MVTableHeaderUserDetailsView.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/15/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVTableHeaderUserDetailsView.h"

@interface MVTableHeaderUserDetailsView()
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userFirstName;
@property (weak, nonatomic) IBOutlet UILabel *userLastName;
@end

@implementation MVTableHeaderUserDetailsView

- (void) setUserDetails:(MVUser*)user
{
    self.userFirstName.text = user.firstName;
    self.userLastName.text = user.lastName;
    self.profilePic.profileID = user.faceBookProfileID;
}

@end
