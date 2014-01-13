//
//  MVFacebookManager.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVFacebookManager.h"
#import "FacebookSdk/FacebookSDK.h"


@implementation MVFacebookManager

-(void)tryConnectWithPreviousToken
{
    // check for a cached session
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded)
    {
        // If there's one, just open the session silently, without showing the user the login UI
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info"]
                                           allowLoginUI:NO
                                      completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                          // Handler for session state changes
                                          // This method will be called EACH time the session state changes,
                                          // also for intermediate states and NOT just when the session open
                                          [self sessionStateChanged:session state:state error:error];
                                      }];
    }
    else
    {
        //simulate connection changed in case it was not connected
        [[NSNotificationCenter defaultCenter] postNotificationName:FB_STATUS_CHANGED object:nil];
    }
}


- (BOOL)isUserConnected
{
    return FBSession.activeSession.isOpen;
}

- (void)logout
{
    [FBSession.activeSession closeAndClearTokenInformation];
}


// This method will handle ALL the session state changes in the app
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FB_STATUS_CHANGED object:nil];
        // If the session was opened successfully
        if (!error && state == FBSessionStateOpen){
            NSLog(@"Session opened");
            return;
        }
        if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed){
            // If the session is closed
            NSLog(@"Session closed");
        }
        
        // Handle errors
        if (error){
            NSLog(@"Error");
            NSString *alertText;
            NSString *alertTitle;
            NSLog(@"FaceBook Error: title: %@ , text: %@", alertTitle, alertText);
            // If the error requires people using an app to make an action outside of the app in order to recover
//            if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
//                alertTitle = @"Something went wrong";
//                alertText = [FBErrorUtility userMessageForError:error];
//                [self showMessage:alertText withTitle:alertTitle];
//            } else {
//                
//                // If the user cancelled login, do nothing
//                if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
//                    NSLog(@"User cancelled login");
//                    
//                    // Handle session closures that happen outside of the app
//                } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
//                    alertTitle = @"Session Error";
//                    alertText = @"Your current session is no longer valid. Please log in again.";
//                    [self showMessage:alertText withTitle:alertTitle];
//                    
//                    // Here we will handle all other errors with a generic error message.
//                    // We recommend you check our Handling Errors guide for more information
//                    // https://developers.facebook.com/docs/ios/errors/
//                } else {
//                    //Get more error information from the error
//                    NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
//                    
//                    // Show the user an error message
//                    alertTitle = @"Something went wrong";
//                    alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
//                    [self showMessage:alertText withTitle:alertTitle];
//                }
//            }
            // Clear this token
            [FBSession.activeSession closeAndClearTokenInformation];
            // Show the user the logged-out UI
            //[self userLoggedOut];TODO://implement
        }
    
    
}

@end
