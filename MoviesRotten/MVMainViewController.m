//
//  MVMainViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/12/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMainViewController.h"
#import "MVLoginViewController.h"
@interface MVMainViewController ()

@end

@implementation MVMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //TODO:handle FB session logout
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self
//               selector:@selector(facebookConnectionChanged:)
//                   name:FB_STATUS_CHANGED
//                 object:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    //TODO:DELETE
//    if (![[[MVAppData sharedInstance] faceBookMgr] isUserConnected])
//    {
//        UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
//        UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];
//        [self presentViewController:loginController animated:YES completion:nil];
//    }
}

-(void)facebookConnectionChanged:(NSNotification *)notification
{
   
}



@end
