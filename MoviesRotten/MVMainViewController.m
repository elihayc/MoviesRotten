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

-(void)facebookConnectionChanged:(NSNotification *)notification
{
   
}



@end
