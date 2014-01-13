//
//  MVBaseViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/10/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVBaseViewController.h"

@interface MVBaseViewController ()
@end

@implementation MVBaseViewController

- (MVAppData*)appData
{
    return [MVAppData sharedInstance];
}
//TODO:DELETE
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)showLoginScreen
{
    //TODO:DELETE
//    UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
//    UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];
//    [self presentViewController:loginController animated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
