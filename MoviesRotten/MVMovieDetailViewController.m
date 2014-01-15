//
//  MVMovieDetailViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/14/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieDetailViewController.h"

@interface MVMovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *movieName;

@end

@implementation MVMovieDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    self.movieName.text = self.movie.title;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

@end
